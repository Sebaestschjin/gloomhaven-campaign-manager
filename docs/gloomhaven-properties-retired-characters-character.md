# Character Schema

```txt
undefined#/properties/retired/items
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## items Type

`object` ([Character](gloomhaven-properties-retired-characters-character.md))

# Character Properties

| Property                | Type      | Required | Nullable       | Defined by                                                                                                                                                        |
| :---------------------- | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [player](#player)       | `string`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-player-name.md "undefined#/properties/retired/items/properties/player")       |
| [character](#character) | `string`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-character-name.md "undefined#/properties/retired/items/properties/character") |
| [class](#class)         | `string`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-character-class.md "undefined#/properties/retired/items/properties/class")    |
| [quest](#quest)         | Merged    | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-personal-quest.md "undefined#/properties/retired/items/properties/quest")     |
| [level](#level)         | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-level.md "undefined#/properties/retired/items/properties/level")              |
| [perks](#perks)         | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-perks.md "undefined#/properties/retired/items/properties/perks")              |

## player




`player`

-   is optional
-   Type: `string` ([Player name](gloomhaven-properties-retired-characters-character-properties-player-name.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-player-name.md "undefined#/properties/retired/items/properties/player")

### player Type

`string` ([Player name](gloomhaven-properties-retired-characters-character-properties-player-name.md))

## character




`character`

-   is optional
-   Type: `string` ([Character name](gloomhaven-properties-retired-characters-character-properties-character-name.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-character-name.md "undefined#/properties/retired/items/properties/character")

### character Type

`string` ([Character name](gloomhaven-properties-retired-characters-character-properties-character-name.md))

## class




`class`

-   is optional
-   Type: `string` ([Character class](gloomhaven-properties-retired-characters-character-properties-character-class.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-character-class.md "undefined#/properties/retired/items/properties/class")

### class Type

`string` ([Character class](gloomhaven-properties-retired-characters-character-properties-character-class.md))

## quest




`quest`

-   is optional
-   Type: merged type ([Personal Quest](gloomhaven-properties-retired-characters-character-properties-personal-quest.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-personal-quest.md "undefined#/properties/retired/items/properties/quest")

### quest Type

merged type ([Personal Quest](gloomhaven-properties-retired-characters-character-properties-personal-quest.md))

one (and only one) of

-   [Untitled string in Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-personal-quest-oneof-0.md "check type definition")
-   [Untitled integer in Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-personal-quest-oneof-1.md "check type definition")

## level




`level`

-   is optional
-   Type: `integer` ([Level](gloomhaven-properties-retired-characters-character-properties-level.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-level.md "undefined#/properties/retired/items/properties/level")

### level Type

`integer` ([Level](gloomhaven-properties-retired-characters-character-properties-level.md))

### level Constraints

**maximum**: the value of this number must smaller than or equal to: `9`

**minimum**: the value of this number must greater than or equal to: `1`

## perks




`perks`

-   is optional
-   Type: `integer` ([Perks](gloomhaven-properties-retired-characters-character-properties-perks.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-retired-characters-character-properties-perks.md "undefined#/properties/retired/items/properties/perks")

### perks Type

`integer` ([Perks](gloomhaven-properties-retired-characters-character-properties-perks.md))
