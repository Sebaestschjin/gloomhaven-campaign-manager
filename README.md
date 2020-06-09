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

# ToDo
## Bugs
- reading achievements doesn't work with the module structure
- Removing the last card from the modifier deck doesn't work, as the deck says it doesn't have any objects left. So having all perks on one character will not work.
- quest cards are not drawn to the correct player hand

## General
- error handling
- logging
- version information in save file
- save file creation
- consistent coding style
- make the waiting for stuff cleaner and consistent (e.g. callback chaining)
- (optional) support YAML reading

## Unlocks
- character boxes
- checkmarks on sheet
- envelopes
- Forgotten Circle expansion

## Party
- setting the party levels on the party sheet

## Characters
- support all character boxes
- add item cards
- add personal quest
- attack modifiers
- health bar from level up
- enhancements
- retirements
- notes at back of card

## Events
- city events
- road events
- rift events

## Shop
- from prosperity
- from unlocks

## Treasure
- remove looted treasure
- remove found random designs
- remove found random scenario

## Other
- timer
- rulebook
- scenario book
