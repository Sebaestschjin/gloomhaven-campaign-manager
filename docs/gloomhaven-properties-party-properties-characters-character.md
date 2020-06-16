# Character Schema

```txt
undefined#/properties/party/properties/characters/items
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## items Type

`object` ([Character](gloomhaven-properties-party-properties-characters-character.md))

# Character Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                         |
| :---------------------------- | --------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [class](#class)               | `string`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-class.md "undefined#/properties/party/properties/characters/items/properties/class")                  |
| [name](#name)                 | `string`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-name.md "undefined#/properties/party/properties/characters/items/properties/name")                    |
| [xp](#xp)                     | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-experience.md "undefined#/properties/party/properties/characters/items/properties/xp")                |
| [gold](#gold)                 | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-gold.md "undefined#/properties/party/properties/characters/items/properties/gold")                    |
| [checkmarks](#checkmarks)     | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-checkmarks.md "undefined#/properties/party/properties/characters/items/properties/checkmarks")        |
| [perks](#perks)               | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-unlocked-perks.md "undefined#/properties/party/properties/characters/items/properties/perks")         |
| [quest](#quest)               | Merged    | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-personal-quest.md "undefined#/properties/party/properties/characters/items/properties/quest")         |
| [abilities](#abilities)       | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-unlocked-abilities.md "undefined#/properties/party/properties/characters/items/properties/abilities") |
| [items](#items)               | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-items.md "undefined#/properties/party/properties/characters/items/properties/items")                  |
| [notes](#notes)               | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-notes.md "undefined#/properties/party/properties/characters/items/properties/notes")                  |
| [hidden_notes](#hidden_notes) | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-hidden-notes.md "undefined#/properties/party/properties/characters/items/properties/hidden_notes")    |

## class




`class`

-   is optional
-   Type: `string` ([Class](gloomhaven-properties-party-properties-characters-character-properties-class.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-class.md "undefined#/properties/party/properties/characters/items/properties/class")

### class Type

`string` ([Class](gloomhaven-properties-party-properties-characters-character-properties-class.md))

## name




`name`

-   is optional
-   Type: `string` ([Name](gloomhaven-properties-party-properties-characters-character-properties-name.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-name.md "undefined#/properties/party/properties/characters/items/properties/name")

### name Type

`string` ([Name](gloomhaven-properties-party-properties-characters-character-properties-name.md))

## xp




`xp`

-   is optional
-   Type: `integer` ([Experience](gloomhaven-properties-party-properties-characters-character-properties-experience.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-experience.md "undefined#/properties/party/properties/characters/items/properties/xp")

### xp Type

`integer` ([Experience](gloomhaven-properties-party-properties-characters-character-properties-experience.md))

### xp Constraints

**maximum**: the value of this number must smaller than or equal to: `450`

**minimum**: the value of this number must greater than or equal to: `0`

## gold




`gold`

-   is optional
-   Type: `integer` ([Gold](gloomhaven-properties-party-properties-characters-character-properties-gold.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-gold.md "undefined#/properties/party/properties/characters/items/properties/gold")

### gold Type

`integer` ([Gold](gloomhaven-properties-party-properties-characters-character-properties-gold.md))

### gold Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## checkmarks




`checkmarks`

-   is optional
-   Type: `integer` ([Checkmarks](gloomhaven-properties-party-properties-characters-character-properties-checkmarks.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-checkmarks.md "undefined#/properties/party/properties/characters/items/properties/checkmarks")

### checkmarks Type

`integer` ([Checkmarks](gloomhaven-properties-party-properties-characters-character-properties-checkmarks.md))

### checkmarks Constraints

**maximum**: the value of this number must smaller than or equal to: `18`

**minimum**: the value of this number must greater than or equal to: `0`

## perks




`perks`

-   is optional
-   Type: `integer[]` ([Perk](gloomhaven-properties-party-properties-characters-character-properties-unlocked-perks-perk.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-unlocked-perks.md "undefined#/properties/party/properties/characters/items/properties/perks")

### perks Type

`integer[]` ([Perk](gloomhaven-properties-party-properties-characters-character-properties-unlocked-perks-perk.md))

## quest




`quest`

-   is optional
-   Type: merged type ([Personal Quest](gloomhaven-properties-party-properties-characters-character-properties-personal-quest.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-personal-quest.md "undefined#/properties/party/properties/characters/items/properties/quest")

### quest Type

merged type ([Personal Quest](gloomhaven-properties-party-properties-characters-character-properties-personal-quest.md))

one (and only one) of

-   [Untitled string in Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-personal-quest-oneof-0.md "check type definition")
-   [Untitled integer in Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-personal-quest-oneof-1.md "check type definition")

## abilities




`abilities`

-   is optional
-   Type: `string[]` ([Ability](gloomhaven-properties-party-properties-characters-character-properties-unlocked-abilities-ability.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-unlocked-abilities.md "undefined#/properties/party/properties/characters/items/properties/abilities")

### abilities Type

`string[]` ([Ability](gloomhaven-properties-party-properties-characters-character-properties-unlocked-abilities-ability.md))

## items




`items`

-   is optional
-   Type: `object[]` ([Item](gloomhaven-properties-party-properties-characters-character-properties-items-item.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-items.md "undefined#/properties/party/properties/characters/items/properties/items")

### items Type

`object[]` ([Item](gloomhaven-properties-party-properties-characters-character-properties-items-item.md))

## notes




`notes`

-   is optional
-   Type: `string[]` ([Note](gloomhaven-properties-party-properties-characters-character-properties-notes-note.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-notes.md "undefined#/properties/party/properties/characters/items/properties/notes")

### notes Type

`string[]` ([Note](gloomhaven-properties-party-properties-characters-character-properties-notes-note.md))

## hidden_notes




`hidden_notes`

-   is optional
-   Type: `string[]` ([Note](gloomhaven-properties-party-properties-characters-character-properties-hidden-notes-note.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-hidden-notes.md "undefined#/properties/party/properties/characters/items/properties/hidden_notes")

### hidden_notes Type

`string[]` ([Note](gloomhaven-properties-party-properties-characters-character-properties-hidden-notes-note.md))
