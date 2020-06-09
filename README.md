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
- the object now has a button, hit that and the save loades

# Features
## World Map
- ✔️ Unlocked/Done/Locked scenarios
- ✔️ Prosperity
- ✔️ Global Achievements (currently broken)

## Party sheet
- ✔️ Name
- ✔️ Reputation
- ✔️ Achievements
- ✔️ Notes
- ❌ Party level

## Characters
- ✔️ Name
- ✔️ Class
- ✔️ XP/Gold
- ❌ Adjust HP to level
- ✔️ Notes/Item Notes
- ✔️ Modify attack modifiers according to unlocked perks
- ❌ Hand out item cards
- ✔️ Hand out Personal Quest card
- ✔️ Hand out unlocked abilities
- ❌ Enhancements
- ❌ Retirement
- ❌ Notes on the back of the characters sheet

## Items/Loot
- ❌ Build shop from prosperity
- ❌ Move found items to the shop
- ❌ Remove found item designs/scenarios from their decks
- ❌ Remove looted treasure from the loot deck

## Events
- ❌ City Events
- ❌ Road Events

## Locked content
- ✔️ New character classes
  - Not all features might be supported for all new classes. I haven't unlocked them, so they might have content I'm not aware of yet.
- ❌ Special conditions
- ❌ Town Records
- ❌ Envelopes
- ❌ Forgotten Circle expansion

# Known Bugs
- Reading achievements is currently broken
- Removing the last card from the modifier deck doesn't work, as the deck says it doesn't have any objects left. So having all perks on one character will not work.
- quest cards are not drawn to the correct player hand

# ToDo
## General
- Error handling
- Logging
- Comments...
- How to handle different version?
- Save file creation from current save
- Consistent coding style
- Make the waiting for stuff cleaner and consistent (e.g. callback chaining)
- (optional) Support YAML reading

## Other
- Timer
- Rulebook
- Scenario book
