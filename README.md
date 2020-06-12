# Beware!
This code contains mild spoilers for Gloomhaven. The names and perks of all available classes are listed in the `info.ttslua` file (and maybe somewhere else), so don't look there if that's a problem for you. :-)

# How To Use
There's not a Workshop mod yet, so here's how to set this up:
- requires Atom and the TTS plugin for Atom
- clone this repo
- within the settings of the TTS Atom plugin set the base path for includes to the path of the cloned repo
- start a new Gloomhaven game
- insert a new object (e.g. a Poker chip)
- create a new notebook named Savefile
- save the game and load it right away
- add the following script to the object
```
#include gloomhaven/save_handler

function onLoad(save_state)
  self.createButton({
    click_function = "read_save",
    function_owner = self,
    color = {0, 0, 0, 0},
    position = {0,0.05,0},
    width = 2400, height = 600,
    label = "",
    tooltip = ""
  })
end

function read_save()
  save_handler.read()
end
```
- hit Ctrl+Shift+S in Atom
- insert the save file you want to load into the notebook
- the object now has a button, hit that and the save loads

# Features/Roadmap
| General Features                    | Read | Write |
| ----------------------------------- | :--: | :---: |
| Scenarios                           | ✔️    | ❌   |
| Prosperity                          | ✔️    | ❌   |
| Achievements                        | ✔️    | ❌   |
| Party Sheet                         | ✔️    | ❌   |
| Character classes                   | ✔️    | ❌   |
| Character sheets                    | ✔️    | ❌   |
| Character attack modifiers          | ✔️    | ❌   |
| Character item cards                | ✔️    | ❌   |
| Unlocked abilities                  | ✔️    | ❌   |
| Personal quests                     | ✔️    | ❌   |
| Enhancements                        | ❌   | ❌   |
| Current character deck              | ❌   | ❌   |
| Retired characters                  | ✔️    | ❌   |
| Shop                                | ❌   | ❌   |
| Looted Items                        | ❌   | ❌   |
| Events                              | ❌   | ❌   |
| Unlocked character classes          | ✔️    | ❌   |
| Unlocked special conditions         | ✔️    | ❌   |
| Unlocked envelopes                  | ❌   | ❌   |
| Forgotten Circle expansion          | ❌   | ❌   |


| Customizable Features               | Done |
| ----------------------------------- | :--: |
| Customizable component positions    | ❌  |
| Include extended battle goals       | ❌  |
| Additional components (e.g. Timer)  | ❌  |


# Known Bugs
- Removing the last card from the modifier deck doesn't work, as the deck says it doesn't have any objects left. So having all perks on one character will not work.

# ToDo
- [ ] Error handling
- [ ] Logging
- [ ] Code documentation
- [ ] Usage documentation
- [ ] Handle diffrent versions of save file and game
- [ ] Clean code Roundhouse kick
- [ ] Make waiting easier to use and more obvious
- [ ] (optional) Support YAML file
