# Gloomhaven Campaign Manager
The Gloomhaven Campaign Manager aims to simplify to keep your Gloomhaven campaign updated to the current version of the [Gloomhaven Fantasy Setup Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=1301493206) for Tabletop Simulator. It generates save files that describe the current state of a Gloomhaven campaign that can then be used to automatically setup the campaign in the Tabletop Simulator mod.

Checkout [How to Use](https://github.com/Sebaestschjin/gloomhaven-saveloader/wiki/How-to-use) for a quick-start guide.

# Spoiler Warning
This code contains some mild spoilers for Gloomhaven. The names of all available classes, their perks and ability names are listed in the file `game.ttslua`. So don't look there if that's a problem for you.

# Features/Roadmap
| General Features                    | Done |
| ----------------------------------- | :--: |
| Scenarios                           | ✔️    |
| Prosperity                          | ✔️    |
| Achievements                        | ✔️    |
| Party Sheet                         | ✔️    |
| Character classes                   | ✔️    |
| Character sheets                    | ✔️    |
| Character attack modifiers          | ✔️    |
| Character item cards                | ✔️    |
| Unlocked abilities                  | ✔️    |
| Personal quests                     | ✔️    |
| Retired characters                  | ✔️    |
| Shop                                | ✔️    |
| Looted Items                        | ✔️    |
| Unlocked character classes          | ✔️    |
| Unlocked special conditions         | ✔️    |
| Events                              | ✔️    |
| Current character deck              | ❌   |
| Unlocked envelopes                  | ❌*  |
| Enhancements                        | ✔️    |

\* Envelope B is included

| Expansion Features                    | Done |
| ------------------------------------- | :--: |
| Forgotten Circles - Diviner class     | ✔️*   |
| Forgotten Circles - City-/Road-Events | ✔️    |
| Forgotten Circles - Rift-Events       | ❌  |
| Forgotten Circles - Replacement Cards | ❌  |
| Forgotten Circles - Reward Items      | ✔️    |

\* Second printing cards might not work correctly yet


| Customization Features              | Done |
| ----------------------------------- | :--: |
| Customizable component positions    | ❌  |
| Include extended battle goals       | ❌  |
| Additional components (e.g. Timer)  | ❌  |


# How to use the code
* Install Atom and the [Atom TTS Plugin](https://api.tabletopsimulator.com/atom/)
* Configure the _Base path for files you wish to bundle or #include_ in Atom (under `Settings > Packages > Tabletopsimulator Lua`) to the path where you'd like to save your TTS code (like this repository)
* Clone this repository to the configured path
* Also clone the repositories [sebaestschjin-tts](https://github.com/Sebaestschjin/sebaestschjin-tts) and [ge_tts](https://github.com/Benjamin-Dobell/ge_tts) to this path, as those are required libaries
* Create an object in TTS (or use the existing [Workshop object](https://steamcommunity.com/id/sebaestschjin/myworkshopfiles/?appid=286160)) and put the code `require('gloomhaven-campaign-manager.module.CampaignManagerUI')` into the object's script
* Use the `SaveAndPlay` action inside Atom (ctrl+shift+s per default)
