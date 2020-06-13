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
- add the script from `ui.ttslua` to the object
- hit Ctrl+Shift+S in Atom
- insert the save file you want to load into the notebook
- the object now has a button, hit that and the save loads

# Features/Roadmap
| General Features                    | Read | Write |
| ----------------------------------- | :--: | :---: |
| Scenarios                           | ✔️    | ❌   |
| Prosperity                          | ✔️    | ✔️    |
| Achievements                        | ✔️    | ❌   |
| Party Sheet                         | ✔️    | ✔️    |
| Character classes                   | ✔️    | ❌   |
| Character sheets                    | ✔️    | ❌   |
| Character attack modifiers          | ✔️    | ❌   |
| Character item cards                | ✔️    | ❌   |
| Unlocked abilities                  | ✔️    | ❌   |
| Personal quests                     | ✔️    | ❌   |
| Retired characters                  | ✔️    | ❌   |
| Shop                                | ✔️    | ❌   |
| Looted Items                        | ✔️    | ❌   |
| Unlocked character classes          | ✔️    | ❌   |
| Unlocked special conditions         | ✔️    | ❌   |
| Events                              | ✔️    | ❌   |
| Current character deck              | ❌   | ❌   |
| Unlocked envelopes                  | ❌   | ❌   |
| Forgotten Circle expansion          | ❌   | ❌   |
| Enhancements                        | ❌   | ❌   |


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
- [ ] put the locked characters back into the game box
- [ ] 🐍 ➡️ 🐫
