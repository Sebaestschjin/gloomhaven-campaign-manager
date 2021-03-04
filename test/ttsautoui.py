from datetime import datetime
import pyautogui as ui
import time
import win32clipboard

ui.PAUSE = 0.5

IMAGE_TIMEOUT = 60


def create_singleplayer():
    click_image("res/menu/create.png")
    click_image("res/menu/singleplayer.png")


def load_workshop(name, folders=[], additive=False, wait_for_loading=IMAGE_TIMEOUT):
    if additive:
        click_image("res/menu/games.png")
    click_image("res/menu/workshop.png")
    goto_folder(folders, "game")
    if additive:
        goto_image(f"res/game/{name}.png")
        ui.move(45, -55)
        ui.click()
        click_image("res/button/additive_load.png")
        click_image("res/button/load.png")
        time.sleep(5)
    else:
        click_image(f"res/game/{name}.png")
        click_image("res/button/load.png")
        wait_for_image("res/chat/loading_complete.png", wait_for_loading)


def load_save(name, folders=[], wait_for_loading=IMAGE_TIMEOUT):
    click_image("res/menu/save_and_load.png")
    goto_folder(folders, "save")
    click_image(f"res/save/{name}.png")
    click_image("res/button/load.png")
    wait_for_image("res/chat/loading_complete.png", wait_for_loading)


def load_saved_object(name, folders=[]):
    click_image("res/menu/objects.png")
    click_image("res/menu/saved_objects.png")
    goto_folder(folders, "object")
    click_image(f"res/object/{name}.png")
    ui.move(45, -110)
    ui.click()
    ui.move(0, 35)
    ui.click()
    ui.press("esc")


def goto_folder(folders, base):
    for folder in folders:
        click_image(f"res/folder/{base}/{folder}.png")


def goto_main_menu():
    if find_image("res/menu/create.png"):
        return
    click_image("res/menu/menu.png")
    click_image("res/menu/main_menu.png")
    click_image("res/button/yes.png")
    time.sleep(10)


def enter_chat(text):
    click_image("res/menu/chat.png")
    ui.write(text, interval=0.1)
    time.sleep(1)
    ui.press("enter")


def create_notebook(name, content):
    click_image("res/menu/notebook.png")

    notebook_image = f"res/notebook/{name}.png"
    if not find_image(notebook_image):
        click_image("res/button/add_notebook.png")
        ui.write(name)
        ui.press("enter")

    set_clipboard(content)
    click_image(notebook_image)
    ui.move(100, 0)
    ui.click()
    ui.hotkey("ctrl", "v")
    click_image(f"res/notebook/{name}.png")
    ui.press("esc")


def get_notebook(name):
    click_image("res/menu/notebook.png")
    click_image(f"res/notebook/{name}.png")
    ui.move(80, 30)
    ui.click()
    ui.hotkey("ctrl", "a")
    ui.hotkey("ctrl", "c")
    time.sleep(1)
    ui.press("esc")
    return get_clipboard()


def find_image(name):
    return ui.locateCenterOnScreen(name, confidence=0.9) is not None


def goto_image(name):
    position = ui.locateCenterOnScreen(name, confidence=0.9)
    if not position:
        raise ValueError(f"Can find't image {name}")
    x, y = position
    ui.moveTo(x, y)
    time.sleep(1)


def click_image(name):
    position = ui.locateCenterOnScreen(name, confidence=0.9)
    if not position:
        raise ValueError(f"Can find't image {name}")
    x, y = position
    ui.click(x, y)
    time.sleep(1)


def wait_for_image(name, timeout=IMAGE_TIMEOUT):
    start = datetime.now()
    while True:
        position = ui.locateCenterOnScreen(name, confidence=0.9)
        if position:
            return
        time.sleep(2)
        if (datetime.now() - start).total_seconds() >= timeout:
            raise ValueError(f"Waited to long for image {name} to appear")


def set_clipboard(value):
    win32clipboard.OpenClipboard()
    win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardText(value)
    win32clipboard.CloseClipboard()


def get_clipboard():
    win32clipboard.OpenClipboard()
    data = win32clipboard.GetClipboardData()
    win32clipboard.CloseClipboard()
    return data
