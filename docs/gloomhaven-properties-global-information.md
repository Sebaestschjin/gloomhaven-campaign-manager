# Global Information Schema

```txt
undefined#/properties/global
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## global Type

`object` ([Global Information](gloomhaven-properties-global-information.md))

# Global Information Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                                            |
| :---------------------------- | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [prosperity](#prosperity)     | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-prosperity.md "undefined#/properties/global/properties/prosperity")         |
| [sanctuary](#sanctuary)       | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-sanctuary-level.md "undefined#/properties/global/properties/sanctuary")     |
| [achievements](#achievements) | `array`   | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-achievements.md "undefined#/properties/global/properties/achievements")     |
| [scenarios](#scenarios)       | `object`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-available-scenarios.md "undefined#/properties/global/properties/scenarios") |

## prosperity

The number of checked boxes on the prosperity track


`prosperity`

-   is optional
-   Type: `integer` ([Prosperity](gloomhaven-properties-global-information-properties-prosperity.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-prosperity.md "undefined#/properties/global/properties/prosperity")

### prosperity Type

`integer` ([Prosperity](gloomhaven-properties-global-information-properties-prosperity.md))

### prosperity Constraints

**maximum**: the value of this number must smaller than or equal to: `63`

**minimum**: the value of this number must greater than or equal to: `0`

## sanctuary

The number of checked boxes on the sanctuary track. If not included the sanctuary will not be loaded.


`sanctuary`

-   is optional
-   Type: `integer` ([Sanctuary Level](gloomhaven-properties-global-information-properties-sanctuary-level.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-sanctuary-level.md "undefined#/properties/global/properties/sanctuary")

### sanctuary Type

`integer` ([Sanctuary Level](gloomhaven-properties-global-information-properties-sanctuary-level.md))

### sanctuary Constraints

**maximum**: the value of this number must smaller than or equal to: `70`

**minimum**: the value of this number must greater than or equal to: `0`

## achievements

The list of global achievements.


`achievements`

-   is optional
-   Type: `object[]` ([Achievement](gloomhaven-properties-global-information-properties-achievements-achievement.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-achievements.md "undefined#/properties/global/properties/achievements")

### achievements Type

`object[]` ([Achievement](gloomhaven-properties-global-information-properties-achievements-achievement.md))

### achievements Constraints

**unknown format**: the value of this string must follow the format: `table`

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## scenarios

The list of available scenarios. Locked scenarios are the ones that currently can't be started e.g. because a global achievement prevents that.


`scenarios`

-   is optional
-   Type: `object` ([Available Scenarios](gloomhaven-properties-global-information-properties-available-scenarios.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-available-scenarios.md "undefined#/properties/global/properties/scenarios")

### scenarios Type

`object` ([Available Scenarios](gloomhaven-properties-global-information-properties-available-scenarios.md))

### scenarios Constraints

**maximum number of properties**: the maximum number of properties for this object is: `115`
