# Party Schema

```txt
undefined#/properties/party
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## party Type

`object` ([Party](gloomhaven-properties-party.md))

# Party Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                          |
| :---------------------------- | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
| [name](#name)                 | `string`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-name.md "undefined#/properties/party/properties/name")                 |
| [location](#location)         | `string`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-location.md "undefined#/properties/party/properties/location")         |
| [reputation](#reputation)     | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-reputation.md "undefined#/properties/party/properties/reputation")     |
| [notes](#notes)               | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-notes.md "undefined#/properties/party/properties/notes")               |
| [achievements](#achievements) | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-achievements.md "undefined#/properties/party/properties/achievements") |
| [characters](#characters)     | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters.md "undefined#/properties/party/properties/characters")     |

## name




`name`

-   is optional
-   Type: `string` ([Name](gloomhaven-properties-party-properties-name.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-name.md "undefined#/properties/party/properties/name")

### name Type

`string` ([Name](gloomhaven-properties-party-properties-name.md))

## location




`location`

-   is optional
-   Type: `string` ([Location](gloomhaven-properties-party-properties-location.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-location.md "undefined#/properties/party/properties/location")

### location Type

`string` ([Location](gloomhaven-properties-party-properties-location.md))

## reputation




`reputation`

-   is optional
-   Type: `integer` ([Reputation](gloomhaven-properties-party-properties-reputation.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-reputation.md "undefined#/properties/party/properties/reputation")

### reputation Type

`integer` ([Reputation](gloomhaven-properties-party-properties-reputation.md))

### reputation Constraints

**maximum**: the value of this number must smaller than or equal to: `20`

**minimum**: the value of this number must greater than or equal to: `-20`

## notes




`notes`

-   is optional
-   Type: `string[]` ([Note](gloomhaven-properties-party-properties-notes-note.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-notes.md "undefined#/properties/party/properties/notes")

### notes Type

`string[]` ([Note](gloomhaven-properties-party-properties-notes-note.md))

## achievements




`achievements`

-   is optional
-   Type: `string[]` ([Achievement](gloomhaven-properties-party-properties-achievements-achievement.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-achievements.md "undefined#/properties/party/properties/achievements")

### achievements Type

`string[]` ([Achievement](gloomhaven-properties-party-properties-achievements-achievement.md))

## characters




`characters`

-   is optional
-   Type: `object[]` ([Character](gloomhaven-properties-party-properties-characters-character.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters.md "undefined#/properties/party/properties/characters")

### characters Type

`object[]` ([Character](gloomhaven-properties-party-properties-characters-character.md))
