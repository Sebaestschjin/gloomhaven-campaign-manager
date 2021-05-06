# Gloomhaven Campaign Manager
The Gloomhaven Campaign Manager aims to simplify keeping your [Gloomhaven](https://boardgamegeek.com/boardgame/174430/gloomhaven) campaign updated to the current version of the [Gloomhaven Fantasy Setup Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=1301493206) for Tabletop Simulator.
It generates save files describing the current campaign progress which can then be used to automatically set up the campaign in the Tabletop Simulator mod.

# Spoiler Warning
This code contains some spoilers for Gloomhaven. The names of all available classes, their perks and ability names are
listed in the file `Game.ttslua`. It also contains information about the final reward for the envelope X. Some other
files might also contain spoilers.

# How to use
There's [Steam Workshop Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2163619993) including this code.
Checkout [How to Use](https://github.com/Sebaestschjin/gloomhaven-saveloader/wiki/How-to-use) to learn how to use it and what limitations it currently has.

# How to use the code
* Install Atom and the [Atom TTS Plugin](https://api.tabletopsimulator.com/atom/)
* Configure the _Base path for files you wish to bundle or #include_ in Atom (under `Settings > Packages > Tabletopsimulator Lua`) to the path where you'd like to save your TTS code (like this repository)
* Clone this repository to the configured path
* Create an object in TTS (or use the existing [Workshop object](https://steamcommunity.com/id/sebaestschjin/myworkshopfiles/?appid=286160)) and put the code `require('gloomhaven-campaign-manager.CampaignManagerUI')` into the object's script
* Use the `SaveAndPlay` action inside Atom (ctrl+shift+s per default)
* The object now has two buttons you can use. Alternatively you can use the chat commands `~save~` and `~load~` to trigger the actions.
