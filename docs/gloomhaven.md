# Gloomhaven Campaign Schema

```txt
undefined
```

Information about a campaign for the boardgame Gloomhaven


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                     |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------------ |
| Can be instantiated | Yes        | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json](../out/gloomhaven.schema.json "open original schema") |

## Gloomhaven Campaign Type

`object` ([Gloomhaven Campaign](gloomhaven.md))

# Gloomhaven Campaign Properties

| Property              | Type     | Required | Nullable       | Defined by                                                                                         |
| :-------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------- |
| [global](#global)     | `object` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information.md "undefined#/properties/global")  |
| [unlocked](#unlocked) | `object` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content.md "undefined#/properties/unlocked")  |
| [party](#party)       | `object` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party.md "undefined#/properties/party")                |
| [retired](#retired)   | `array`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-retired-characters.md "undefined#/properties/retired") |
| [events](#events)     | `object` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-event-decks.md "undefined#/properties/events")         |

## global




`global`

-   is optional
-   Type: `object` ([Global Information](gloomhaven-properties-global-information.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information.md "undefined#/properties/global")

### global Type

`object` ([Global Information](gloomhaven-properties-global-information.md))

## unlocked




`unlocked`

-   is optional
-   Type: `object` ([Unlocked content](gloomhaven-properties-unlocked-content.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content.md "undefined#/properties/unlocked")

### unlocked Type

`object` ([Unlocked content](gloomhaven-properties-unlocked-content.md))

## party




`party`

-   is optional
-   Type: `object` ([Party](gloomhaven-properties-party.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party.md "undefined#/properties/party")

### party Type

`object` ([Party](gloomhaven-properties-party.md))

## retired




`retired`

-   is optional
-   Type: `object[]` ([Character](gloomhaven-properties-retired-characters-character.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-retired-characters.md "undefined#/properties/retired")

### retired Type

`object[]` ([Character](gloomhaven-properties-retired-characters-character.md))

## events




`events`

-   is optional
-   Type: `object` ([Event decks](gloomhaven-properties-event-decks.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-event-decks.md "undefined#/properties/events")

### events Type

`object` ([Event decks](gloomhaven-properties-event-decks.md))

# Gloomhaven Campaign Definitions

## Definitions group eventType

Reference this group by using

```json
{"$ref":"undefined#/definitions/eventType"}
```

| Property              | Type    | Required | Nullable       | Defined by                                                                                                                            |
| :-------------------- | ------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------ |
| [add](#add)           | `array` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-definitions-eventtype-properties-add.md "undefined#/definitions/eventType/properties/add")           |
| [remove](#remove)     | `array` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-definitions-eventtype-properties-remove.md "undefined#/definitions/eventType/properties/remove")     |
| [bottomUp](#bottomUp) | `array` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-definitions-eventtype-properties-bottomup.md "undefined#/definitions/eventType/properties/bottomUp") |

### add




`add`

-   is optional
-   Type: unknown\[]
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-definitions-eventtype-properties-add.md "undefined#/definitions/eventType/properties/add")

#### add Type

unknown\[]

### remove




`remove`

-   is optional
-   Type: unknown\[]
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-definitions-eventtype-properties-remove.md "undefined#/definitions/eventType/properties/remove")

#### remove Type

unknown\[]

### bottomUp




`bottomUp`

-   is optional
-   Type: unknown\[]
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-definitions-eventtype-properties-bottomup.md "undefined#/definitions/eventType/properties/bottomUp")

#### bottomUp Type

unknown\[]
