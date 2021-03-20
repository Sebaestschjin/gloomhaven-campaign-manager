from assertpy import assert_that
import json
import os
import shutil
import ttsautoui as tts
import time
import pytest

LOAD_TIME = 30  # time to wait for loading to finish
UPGRADE_TIME = 1  # time to wait for upgrading to finish
IGNORE_ALWAYS = ["metadata.date"]
OPTIONS = "options"
HANDS = ["party.characters.1.hand",
         "party.characters.2.hand",
         "party.characters.3.hand",
         "party.characters.4.hand"]


@pytest.fixture()
def main_menu():
    yield "running_test"
    tts.goto_main_menu()


@pytest.mark.parametrize("savefile,ignored", [
    ("all_of_it", [OPTIONS] + HANDS),
    ("all_perks_1", [OPTIONS] + HANDS),
    ("all_perks_2", [OPTIONS] + HANDS),
    ("all_perks_3", [OPTIONS] + HANDS),
    ("all_perks_4", [OPTIONS] + HANDS),
    ("all_perks_5", [OPTIONS] + HANDS),
    ("big", [OPTIONS] + HANDS),
    ("complete", []),
    ("forgotten_circles", [OPTIONS] + HANDS),
    ("typos", [OPTIONS] + HANDS),
])
def test_load_and_save(savefile, ignored, main_menu):
    load_latest_mod()
    saved = load_and_save(savefile)

    assert_same_content(saved, f"{savefile}-expected", ignored)


@pytest.mark.parametrize("savefile,ignored", [
    ("edge_cases", [OPTIONS] + HANDS),
    ("v1", [OPTIONS] + HANDS),
])
def test_save_from_existing_saves(savefile, ignored, main_menu):
    load_from_savegame(savefile)
    saved = save_savefile()

    assert_same_content(saved, f"{savefile}-expected", ignored)


@pytest.mark.parametrize("class_name,ignored", [
    ("witcher", [OPTIONS] + HANDS),
])
def test_load_and_save_custom_classes(class_name, ignored, main_menu):
    savefile = f"custom_class_{class_name}"

    load_latest_mod()
    load_custom_class(class_name)
    saved = load_and_save(savefile)

    assert_same_content(saved, f"{savefile}-expected", ignored)


@pytest.mark.parametrize("savefile,ignored", [
    ("all_of_it", []),
    ("big", []),
    ("complete", []),
    ("forgotten_circles", []),
    ("typos", []),
])
def test_upgrade_save_v1(savefile, ignored, main_menu):
    load_latest_mod()
    saved = load_and_upgrade(f"v1/{savefile}")

    assert_same_content(saved, f"{savefile}-expected", ignored)


@pytest.mark.parametrize("savefile,ignored", [
    ("big", []),
    ("complete", []),
])
def test_upgrade_save_v2(savefile, ignored, main_menu):
    load_latest_mod()
    saved = load_and_upgrade(f"v2/{savefile}")

    assert_same_content(saved, f"{savefile}-expected", ignored)


@pytest.mark.manually
def test_load_manually():
    test_name = "big"
    ignored = HANDS + [OPTIONS]
#     ignored = HANDS

    saved = load_file("manually")

    assert_same_content(saved, f"{test_name}-expected", ignored)


def load_file(filename, parent='input'):
    with open(f"{parent}/{filename}.json", "r", encoding="utf-8") as file:
        return file.read()


def load_latest_mod():
    tts.create_singleplayer()
    tts.load_workshop("gloomhaven", folders=["coop"])
    tts.load_saved_object("campaign_manager", folders=["gloomhaven"])


def load_custom_class(name):
    tts.load_workshop(f"custom_class_{name}", folders=["coop"], additive=True)


def load_from_savegame(name):
    target_name = "TS_Save_1"
    save_path = os.path.expandvars("%userprofile%/documents/My Games/Tabletop Simulator/Saves")

    src = f"input/{name}.json"
    dest = f"{save_path}/Gloomhaven/Test/{target_name}.json"
    shutil.copy2(src, dest)

    src = "res/save/test_whole.png"
    dest = f"{save_path}/Gloomhaven/Test/{target_name}.png"
    shutil.copy2(src, dest)

    tts.create_singleplayer()
    tts.load_save("test", folders=["gloomhaven", "test"], wait_for_loading=360)
    tts.load_saved_object("campaign_manager", folders=["gloomhaven"])


def load_and_save(savefile):
    savefile_content = load_file(savefile)
    load_savefile(savefile_content)
    return save_savefile()


def load_and_upgrade(savefile):
    savefile_content = load_file(savefile)
    return upgrade_savefile(savefile_content)


def load_savefile(savefile_content):
    tts.create_notebook("Savefile", savefile_content)
    tts.enter_chat("~load~")
    time.sleep(LOAD_TIME)


def save_savefile():
    tts.enter_chat("~save~")
    tts.wait_for_image("res/chat/saving_complete.png", 300)
    return tts.get_notebook("new_savefile")


def upgrade_savefile(savefile_content):
    tts.create_notebook("Savefile", savefile_content)
    tts.enter_chat("~upgrade~")
    time.sleep(UPGRADE_TIME)
    return tts.get_notebook("new_savefile")


def delete_part(element, parts):
    if len(parts) == 1 and parts[0] in element:
        del element[parts[0]]
    else:
        next_part = parts.pop(0)
        if next_part in element:
            next_element = element[next_part]
            if type(next_element) == list:
                for ele in next_element:
                    delete_part(ele, [p for p in parts])
            else:
                delete_part(next_element, parts)


def assert_same_content(content, expected_file, ignored):
    content = json.loads(content)
    expected_content = json.loads(load_file(expected_file, 'output'))

    for ign in ignored + IGNORE_ALWAYS:
        parts = ign.split(".")
        delete_part(content, parts)

    assert_that(content).is_equal_to(expected_content)
