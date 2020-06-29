# Beware!
This code contains mild spoilers for Gloomhaven. The names of all availables classes, their perks and ability names are listed in the file `game.ttslua`. So don't look there if that's a problem for you. :-)

# How To Use
There's not a Workshop mod yet, so here's how to set this up:
- requires Atom and the TTS plugin for Atom
- clone this repo
- within the settings of the TTS Atom plugin set the base path for includes to the path of the cloned repo
- start a new Gloomhaven game
- insert a new object (e.g. a Poker chip)
- create a new notebook named Savefile
- save the game and load it right away
- add `#include gloomhaven/saveHandlerUi` to the object
- hit Ctrl+Shift+S in Atom
- insert the save file you want to load into the notebook
- the object now has a button, hit that and the save loads

# Creating a save file
## From the current Gloomhaven save
### Requirements
- Don't put decals on cards that can't have decals.

## Manually
You can generate the JSON manually. For a starting point, look at the `example_save.json`. Most of the fields should be obvious and you can replace them with your input. If you want to write the file by hand or modify the example, I'd also recommand to use YAML instead of JSON, since it's easier to type. You convert between those two formats with [this tool].

## Using an UI
- Download the file `docs/gloomhaven-campaign-manager.json`
- Open [the tool]
- Hit the `upload` button in the top menu
- Select the downloaded file
- Ready to go :-)

# Features/Roadmap
| General Features                    | Load | Save |
| ----------------------------------- | :--: | :--: |
| Scenarios                           | ✔️    | ✔️    |
| Prosperity                          | ✔️    | ✔️    |
| Achievements                        | ✔️    | ✔️    |
| Party Sheet                         | ✔️    | ✔️    |
| Character classes                   | ✔️    | ✔️    |
| Character sheets                    | ✔️    | ✔️    |
| Character attack modifiers          | ✔️    | ✔️    |
| Character item cards                | ✔️    | ✔️    |
| Unlocked abilities                  | ✔️    | ✔️    |
| Personal quests                     | ✔️    | ✔️    |
| Retired characters                  | ✔️    | ✔️    |
| Shop                                | ✔️    | ✔️    |
| Looted Items                        | ✔️    | ✔️    |
| Unlocked character classes          | ✔️    | ✔️    |
| Unlocked special conditions         | ✔️    | ✔️    |
| Events                              | ✔️    | ✔️    |
| Current character deck              | ❌   | ❌   |
| Unlocked envelopes                  | ❌*  | ❌*  |
| Enhancements                        | ✔️    | ✔️   |

\* Envelope B is included

| Expansion Features                   | Load | Save |
| ------------------------------------ | :--: | :--: |
| Forgotten Circle - Diviner class     | ✔️    | ✔️    |
| Forgotten Circle - Events            | ❌  | ❌   |
| Forgotten Circle - Replacement Cards | ❌  | ❌   |
| Forgotten Circle - Items             | ❌  | ❌   |


| Customization Features              | Done |
| ----------------------------------- | :--: |
| Customizable component positions    | ❌  |
| Include extended battle goals       | ❌  |
| Additional components (e.g. Timer)  | ❌  |


# Limitations
- Enhancements can only be loaded for classes in the active party. The same applies for saving enhancements. So currently it would be best practice to save the `enhancements` section of a generated save file seperatly and include it, when a save file shall be loaded.
- Only 4 characters can be loaded. If more characters are currently created they have to be kept in multiple save files


# ToDo
- [ ] Fix Elementalist "Eternal Equilibrium" ability

[this tool]: https://www.json2yaml.com/
[the tool]: https://pmk65.github.io/jedemov2/dist/demo.html
