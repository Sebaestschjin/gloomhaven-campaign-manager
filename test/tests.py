from assertpy import assert_that
import json
import os
import shutil
import ttsautoui as tts
import time
import pytest

LOAD_TIME = 25  # time to wait for loading to finish
SAVE_TIME = 5  # time to wait for saving to finish


@pytest.fixture()
def main_menu():
    yield "running_test"
    tts.goto_main_menu()


@pytest.mark.parametrize("savefile", [
    "all_of_it",
    "all_perks_1",
    "all_perks_2",
    "all_perks_3",
    "all_perks_4",
    "all_perks_5",
    "complete",
    "forgotten_circles",
    "typos",
])
def test_load_and_save(savefile, main_menu):
    load_latest_mod()
    saved = load_and_save(savefile)

    assert_same_content(saved, f"{savefile}-expected")


@pytest.mark.parametrize("savefile", [
    "edge_cases",
    "v1"
])
def test_save_from_existing_saves(savefile, main_menu):
    load_from_savegame(savefile)
    saved = save_savefile()

    assert_same_content(saved, f"{savefile}-expected")


@pytest.mark.parametrize("class_name", [
    "witcher"
])
def test_load_and_save_custom_classes(class_name, main_menu):
    savefile = f"custom_class_{class_name}"

    load_latest_mod()
    load_custom_class(class_name)
    saved = load_and_save(savefile)

    assert_same_content(saved, f"{savefile}-expected")


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
    tts.load_save("test", folders=["gloomhaven", "test"])
    tts.load_saved_object("campaign_manager", folders=["gloomhaven"])


def load_and_save(savefile):
    savefile_content = load_file(savefile)
    load_savefile(savefile_content)
    return save_savefile()


def load_savefile(savefile_content):
    tts.create_notebook("Savefile", savefile_content)
    tts.enter_chat("~load~")
    time.sleep(LOAD_TIME)


def save_savefile():
    tts.enter_chat("~save~")
    time.sleep(SAVE_TIME)
    return tts.get_notebook("new_savefile")


def assert_same_content(content, expected_file):
    content = json.loads(content)
    expected_content = json.loads(load_file(expected_file, 'output'))

    del content['metadata']['date']

    print(content)
    print('----')
    print(expected_content)
    assert_that(content).is_equal_to(expected_content)
