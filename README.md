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
You can use the [generated form] based on JSON schema.

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
| Unlocked envelopes                  | ❌   | ❌   |
| Enhancements                        | ❌   | ❌   |

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
- [ ] Error handling
- [ ] Logging
- [ ] Usage documentation
- [ ] Handle different versions of save file and game
- [ ] put the locked characters back into the game box
- [ ] check Doomstalker unlocked abilities

[this tool]: https://www.json2yaml.com/
[generated form]: https://pmk65.github.io/jedemov2/dist/demo.html?schema=EQbwOgdgBFbAJAZwMYAsCmBbAhnAXLMKgC7EAOeA9JQFaID2EAtChjgHT0BOA5pa1mwBiOABpIMOMQCWxADbp8hAOJz69TKmwA3dNADC2TGWzSeEMRMIATdCi7SyMxkrgBJCADNuOZ9GwARvQArsRQ2FDIRiZm0N5cUMQYUEHYXNY8RuhQquqaOnqW0ITEAJ5kisAEcPQBNOjIxEWSwGRc9BVcMnZK4MUtPGoB2HK9VjAtMvKV1cC5w3JQHvG%2B0i7A4v0TUuUzhLX1jc0TLW0d6F3SPVVQfScncGeInbKlY1v3JbIKrsAACu1nhdXsdPi1bPZHH5fgAVZIQYKYAIXKD0TyRDDIADW6GsKXoAA87KjoElsk8XmVElxsNjQWCdhVftIIMR0DwLvTPnBMCzpJhEUoAAybMHbYA4An8wU3ABsAGZxvcAL6ihnARDYCCNYJpN43O5ir7TX4AZS1Or1UAAMuhdKMNkrucAIcgHE41hYbnA4dkEUiUWiMQ0cXigkTECTEslNdriLquKVqbSsewluiIPQwizkHJgrY8WSoLHLYmoAB3aRyRaZsLIqBqbAF9hc%2B6MvZwFlsjlcVsPCV8gWYYVqsU87BSodKADsQqdE1V85atNQV10mD0xEQ7yNxp%2B3uAAEE0GusJvt46Pm2XXY3VDPbDknJpIgwkHBrURuET3az6zEC2l67u2vxpDS%2BqjuqKzYE0B7EIE%2B6Qc6wQQNIACOwToG4bKYBeBDEFwmFIdeshYHhtxLteZRMgeBwNLBxHOlM%2B6zMeq6%2FhurJ9teXDoBh0i8dYSgANqUc6EBZHAYkTAAuox15nJ03TkYau4tBJG47mp%2FbMR2wAAHKSUB2niq67rQgevpQBp2RBkWK6npxDHSUxuy%2FK%2BDgQDwUlXmKi6%2BeqyAhFxBouVR3x6fowXOQFY43pCHrrLMpoaNkDkceekRaik2Q8FmbLQAKcgyGQCiJPydiAfJcXUXpXbspyxkmYQkrSsONwAKzVeqtieNgwTFUoACMYUwMqYXjbFUCTX58lwCgehpGsKnSVIEW%2FIe2imHICHZKayCLQ49AXt1cBmfeSWEFZz6vqi6I6Ntu3FgdElHQBNr0NiuLPYdy3hLx0a2RAxJJDBkTBFwvGsnISZRBAADkdbZK%2BaRsni6DsDwabIlEwSIGlUAfgs37seum5QG0v7%2FtGMFVatwC1b8dFHE16qKRcZSGRuK1TacMFslwXqzAAemAYtgNYADU8A%2Bbu%2FnAcATbWLInojAC5yXNcBCqUaIEHh5LLeazcV6DKBCicAADyFReqIhAACKMJUdtwNan2hnAMnSfLusShO6tKVc5FDUNHWUTNKpKj7LQoWoX1CaFV5rSaB4AKoQHHoaRIwBUxa5NGzMzecKe0gdaxRAVwLm2CIPjPMK7pvz6FoNKNCi1e19cp3xXeiVC1dT4vm%2B6Kx%2B731oGktIC5EO2d%2B9bj3VAG4BgkdnJCYXRJnjxLZaP2JPR3kayFAACyqemjC4RyAwOUU%2B02jSAWUAYLxdNTXrsxgdgEH06RuFaQ3daB59CzxOmFD%2BhADZeVlkaCOnxo4kRwvXX2jcDwACV0DljSHiP%2BYD3493Mg%2BSy8IsiRiDLxLB6QoC4KgHvUMaY4THWyJWast8lbfWIPQQGxZOGvygFZP%2BWVoBBQ3FATw7RMDcIodgyMthsSogSEWQREJYhQDkambikw3IHi%2Fj%2FfBuCAEoKAbMbCWBNHikZvrAihsYF%2BXDnNDUFRkDSBGAAfSChAZWfhkE1WMYQU0TiXGLA8V4z0eCFbnT7rCVuWI7rFkCV%2BEJKtGCRlBmEAUt16wbjCJw2hGd3aRA5qYaAmRREiLIE7f85iIE1DqPRaprRS4cyDoYuKForislcWyNAmY1A8H1NrUae49KHm1B0sIMIGioF6fQfp5j%2ByRIsrMeZFjtGzCCPQBQWoVngnQH1AasECB9WvooXm01urghpDiVxpgCytKMSnWY9srnZEPI%2FXEOybC3kIZdKSxsUFrMIBsrZtshlnT2f1QaNxjn4wmhcmwjAYJhPub4x5%2FiLTxitI7CS3jPngoSkswgeKGaAs7KyBqvZ%2FlxV5KhKcNwRRgr9pOM2UAhoMrObs%2FZUKCBzjOQguKahyyuN4mQUISLLo60AWi129ByxQAwaK%2BCFl4W7IJUQ5ZVL1SWPWeoEFxLeqQsOWIkYsK%2BXwrgIKuwxBhXoEVeK%2FukqHksUIG7csVr5W2rFcqxliz1VEs1fnPSwL0DbIDdeA1BylAwtOdpfl6pVw8FQDau1hLHWoudXAAAEmYEgHqU1EJVV8tVvzgDEu1UC3VIbQUcq%2BVyo10a4XgKIDmq1yavV%2BrTVqvxWaW23QVe29Yhb8W90JX8odJKC4Vs2VW%2FVELI3QpNTGtScbnS8RkIJFFXbpXAAweu76EQJ6twFrO4t%2Fcx2MvLXAYNobx0Ru5cak5E1vbh3nHA85SpHiowGRXJi3b%2FhftbMOn5Z7S3%2FJqcAIugHGka2UpuuANlN2TD%2FVzZ29NL0amsdA0tAUV2EDjvaxDwzfhuyiN6%2FB6GoFG3sZROAIqB0OrQ3%2B%2FtSqC1odJcAeqPYGk0rakoJgAAmdlCtWp0oIIJ6jldgC1nLp2pD279JZi7vTX1JaGnod0Q0gxidtLJwzQZRTKzwOUdsWCN9JxcNwHSmTKp2mnUjJ%2FNZrcDSVMgbU%2BxjTYbOxIMI3JvTbFHKbkMxOvSxnsNywk3FQ9U8Lg%2BK3Xp5uk825cHCb7Fzvw3OTss5Db%2BmnvO2alfFlu0XKXmuC0zOpLNSvs01rFhWh8fPhW3SAmuKXmpGcw1RmtuHxJGUGTW3zekUOfK0ZljDnlOvNW69eAkZAGs6T%2FQAURm8CPQB1hslHY5xxqhaWg8dE1AITzUWoTl4zcAALB1Xlk3x15TkAnPrR2iMHmUJshOO2Nuja2yVoZu3BwsquyZKb%2FY0AhhwFwLEtW1K6cipiLEYOIfrfA19xHA5aX%2Ffe%2BOZl7UCBDQABxDKB%2BKToCP8smWh78dOmdvp%2FAuCTjHBCLqubDYG0C2W9GPa82RObjW9M0%2FB%2BtkbdVyVceZ%2BqPbLKhrvd2yd%2FbocfvTQJ%2BOjCVrucDd%2BHzhgElFgAEVMKvhR2lg8KOnaW08CJeXMAQAfZCx1uA77%2BsTCt0j4XjUFcO69l18dgQqwqxk%2FL8nad8nxygIeAIPvYOi4Wd8xn6XI%2BrNGx5%2BnWmHuPae6xMPz4ygC%2Bt%2B5W3YWjtmdgeO5PP6jsB5MXl%2BnhuNX0%2FU2zlHJfZN2d%2BKY9qUuc%2B0Qq8XDn0Gy6Q7a1J3rpfU8WOQ0ZdvOl2OhYtwuCfhAKmIGSQxh3v7t1%2FGOkv7PUfT2x7n4L3P42t%2FilNtjqAFtM0hre4QQ8XBMDcDEIQTNWprC2k8AxR%2Fz%2B0E5vf3AAAQuoJzDYQgX%2FbAHgEaIAv%2FUA%2FjB%2FSAngRUCA4AdOPiYIRwCoK%2FOAY8GQXQcAl2I8RoaQXQaAhAzAgg9AeA3Akg3QM7T2GfMaGfQvcLT3RlaTfvZvA8BTNkVrMnBnKJI3OPffHRevfgwgRvGfcvQgDg1DFfDvWYafB3Bg0zcdVcawWwCAVxFg1XNPR%2FR%2BVQqASQrgnTHg0dUDWvdzIQpPPLFPHvVBWYSQ7PdrQ%2FfPSbAnJ9KaBQwvN9BBWjdAPde7YfUfbdXdASb6BLI9GLKDavf1YicDRPecTnf%2BUnebJrIrJLbicDSDTVR4JpGrQjR4HaUoRqKwtg2YP4fIlEBDUXBwmxJwxQ%2BmKLVIxIuLGHRLaeCo0rCjPPb2buerRo1fQrFo9uUBILDoxwro%2BmZXfXXonnPSDXRFHXPXbvVLaPXgmvJtE3M3G4USGtJ3MrKxRw%2B3ZqHY9DZHYAN3bSD3OWbuBQe0BrcQ12X8B0UrSI89M5Z3bsbbJtcXU%2FSXT4mXFlAATjGPwWJ1YKSN51pwMJ6mWOMOGM2xd0pWfRw1fSjkgjgCpkAKKLVwPAW10FZDURDEhKAxjz4OiN2MLi7yg2qwj0xPFGcSzymKxNmH0FeCgBxPPGc2hL9ReIbjMPAlyy5wZICL0zZJCnaLhPeIRLcIi3VHaCbFyIZiY3oCbFZNxMAO7meJMLYwT3MN%2FksP8PTT0hFMWJqnFIpRM3gRfSvE8KsEmmVGACAA%3D&value=EQbwOgdgBDVsBzANgewEYEMnwFxXNLEfAA4BOKAziQKZkCWALgJ65QCsANJEccJRggBjRgFcMZVsDwBGABzdCvOMAxCAFvRoA3GgFsaERpTYBtHst4gVEDAbbwAwk2ZQASqKQ08AWXpImCXpKRnoheCgAX0VLKxs7GgdgABV1GigAERoMABMoAEkIbVzE4CiY2NhreFt7aRUAQWEtIyhkmg0IFFQEKU4VIRRRIzYAJiiLZQBdCuV4SiFDIKo2AkrYeBkkjJQIUtnK%2BFGkgHlaCHgD2PgAZiSAGRQhAGsaHMvJw%2BA5U%2FP4T6IkU%2B0U%2B8GGqBeb1WAIGSAwlEoNBM9XMSl48AAQnREWRXmR%2FmiYDMYfAmPpkXhUddgAAFFAAdzoUEcKDI%2BxhMHgAHVBHkUAAzAoQfl0LrImHEwkqagdehYAD6gwgOSY9F2FPwHJUgiELUY8sYHXUXR6UjwjDIohoVw2wByZAwr3lGHoOSh9QtVptnLtuwwoXVbBkAAZvSpUPT5WySKJGP61RcPZbrVr4BGkfro7H47s2J6U1KfZoEOoozQY3GA4nzcmw%2FBi2kQmWKznq1B83XgGzQmz3kmrTCgWiQWjSBIWNDC%2FE6nh4FltP4AOSUKC5bRPf1Ij5T%2BBZysJtgAWhDnYhraSAHFUCg9OoMLpE52uoaNVT1ioAMo39LPrfAMN8D4rI%2FigL4ErEkrUmomg6PohjGGYWp8AAYvQZAhFAH6GiQyIAbaABSdDPDiGDqMuUA0nCEDilOkGWPAGgSGohroWYazvgxcIIkkGKWoa27vtOpSzsAbh2GgKACRxwAAI5WiESSocq9AQAg7ZpMyohslJ6zwAAHiQQbBqGSG2gg3R9ngAAsox4T6GgdM8egSMRbBWXZKi0Lir6mUQMj9Dc%2FQAGy%2BVAdG6aoaD%2BKqf6UqFPr4aICAIKKGCxjp0kABIoCgzyrsqzJ3ip4HvuFXxknoPlTso1TALUwkqPkFDQJlNBIAYjCXJ5VCqrm9TwK1uQRCOgkwLV9VJJlrrpA0ZB6KyXWkD1VZJLN834mUI2jeNCRJHSwS7JkGDJXQi3ACQy0Hv1wCZby9w0PynWbR5Y1CTx%2FqMF4h4NHp%2BzdZQvVtgNvJuPQJZPeU8X4G910YjlxhQAKmEWq6KkIGdF0AytsPw8ikPVXENS7ddfhdGQyN2CpGAUaBV39EtWNXSJGLHVsz1QztM4qKTrI04y5N0tj9PnZdfXM8dxzswTRCcw18A8%2BTg0BKpNNC%2F9gPvQgdybaFZXUr%2BVWjdzrgAHKgey0u2kBbJQAbJXrHr9HAJoORuhA8p2yiUNzrsi6MFA17PAAhBlEWpMEUAR4iQjdiHwC61qW01aFnHwhq8DJCpeKnf%2BKd1cTIkZPeFuCfAckZkkACiXgGEYWCYXYJBeLhecGWw7AmZb8DmUgllQDZHmkERhujVsluO3MkXRaEsVQG%2BpfAFhlO2FAcNUCx9uVBP6LABVI%2BCbLSQK1ASto6rV0TOPidTMCBy7jQPbunFUrsdSTcYMwOciQ0ASLKHO%2BMQdCIL%2BKgxLKhvFAaugoTbEzwqnbi10Py0CQEgRkxcNpwNkvJJ6IkPw0BoHiRGgoAAarJHymTTLBbA9RAoUPOsPNgwZBw2lfjvd%2Bn8NrM3QP%2Feyd4gEb1hmDVeVAW47mAEILi6dgC8VjCXJ25cFLXTpMMHIK4kbIWbuoHh4YqFuU7F5Vy9Qx6AjKvAWCRgNSsPsi4Mw8gAr9HYEFfoAB2foMhbJQBuDcR2u4UBDRRP5KAHjAr9wcVwKAQUb7DkgJEYAQA&code=EQehAIBUAsFNwGYHsA2KkHcCWA7A5uCrrAM7gCGATvALbk4Am5ALkpQJ4WPjXkNI4U7AHTgAmkgCu4AMb0KDBrMklWNWUgbxyAIyQA3bdx2x0GYQB0cWBOAAUAKxKwGWVpXC5V9GbCS3sRkxhACkAZQB5ADkAUVd3AEpwJxc3NmEtVUokdjsEgG4rFPi2cABecBxYDHBA%2FnNw6Li0yjt%2BGUkaWBxmYQBHSVgOMNNYGXc7C2AAYicBAFpU93nkShophIAaZJcWcgLgIA%3D&style=ETI%3D&theme=bootstrap3&iconlib=bootstrap3&object_layout=normal&template=default&show_errors=interaction&required_by_default=0&no_additional_properties=0&display_required_only=0&remove_empty_properties=0&keep_oneof_values=1&ajax=0&ajaxCredentials=0&show_opt_in=0&disable_edit_json=0&disable_collapse=0&disable_properties=0&disable_array_add=0&disable_array_reorder=0&disable_array_delete=0&enable_array_copy=0&array_controls_top=0&disable_array_delete_all_rows=0&disable_array_delete_last_row=0&prompt_before_delete=1&lib_aceeditor=0&lib_autocomplete=0&lib_sceditor=0&lib_simplemde=0&lib_select2=0&lib_selectize=0&lib_choices=0&lib_flatpickr=0&lib_signaturepad=0&lib_mathjs=0&lib_cleavejs=0&lib_jodit=0&lib_jquery=0&lib_dompurify=0
