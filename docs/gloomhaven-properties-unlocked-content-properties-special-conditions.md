# Special conditions Schema

```txt
undefined#/properties/unlocked/properties/special_conditions
```

Track of special conditions that must be met to unlock certain game components


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## special_conditions Type

`object` ([Special conditions](gloomhaven-properties-unlocked-content-properties-special-conditions.md))

# Special conditions Properties

| Property                                  | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                |
| :---------------------------------------- | --------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [ancient_technology](#ancient_technology) | `boolean` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-ancient-technology.md "undefined#/properties/unlocked/properties/special_conditions/properties/ancient_technology") |
| [drake_aided](#drake_aided)               | `boolean` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-drake-aided.md "undefined#/properties/unlocked/properties/special_conditions/properties/drake_aided")               |
| [donations](#donations)                   | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-sanctuary-donations.md "undefined#/properties/unlocked/properties/special_conditions/properties/donations")         |
| [low_reputation](#low_reputation)         | `boolean` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-low-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/low_reputation")         |
| [lowest_reputation](#lowest_reputation)   | `boolean` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-lowest-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/lowest_reputation")   |
| [high_reputation](#high_reputation)       | `boolean` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-hight-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/high_reputation")      |
| [highest_reputation](#highest_reputation) | `boolean` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-highest-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/highest_reputation") |
| [retired](#retired)                       | `boolean` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-retired-a-character.md "undefined#/properties/unlocked/properties/special_conditions/properties/retired")           |

## ancient_technology




`ancient_technology`

-   is optional
-   Type: `boolean` ([Ancient Technology](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-ancient-technology.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-ancient-technology.md "undefined#/properties/unlocked/properties/special_conditions/properties/ancient_technology")

### ancient_technology Type

`boolean` ([Ancient Technology](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-ancient-technology.md))

## drake_aided




`drake_aided`

-   is optional
-   Type: `boolean` ([Drake Aided](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-drake-aided.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-drake-aided.md "undefined#/properties/unlocked/properties/special_conditions/properties/drake_aided")

### drake_aided Type

`boolean` ([Drake Aided](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-drake-aided.md))

## donations




`donations`

-   is optional
-   Type: `integer` ([Sanctuary Donations](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-sanctuary-donations.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-sanctuary-donations.md "undefined#/properties/unlocked/properties/special_conditions/properties/donations")

### donations Type

`integer` ([Sanctuary Donations](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-sanctuary-donations.md))

### donations Constraints

**maximum**: the value of this number must smaller than or equal to: `10`

**minimum**: the value of this number must greater than or equal to: `0`

## low_reputation




`low_reputation`

-   is optional
-   Type: `boolean` ([Low Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-low-reputation.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-low-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/low_reputation")

### low_reputation Type

`boolean` ([Low Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-low-reputation.md))

## lowest_reputation




`lowest_reputation`

-   is optional
-   Type: `boolean` ([Lowest Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-lowest-reputation.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-lowest-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/lowest_reputation")

### lowest_reputation Type

`boolean` ([Lowest Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-lowest-reputation.md))

## high_reputation




`high_reputation`

-   is optional
-   Type: `boolean` ([Hight Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-hight-reputation.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-hight-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/high_reputation")

### high_reputation Type

`boolean` ([Hight Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-hight-reputation.md))

## highest_reputation




`highest_reputation`

-   is optional
-   Type: `boolean` ([Highest Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-highest-reputation.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-highest-reputation.md "undefined#/properties/unlocked/properties/special_conditions/properties/highest_reputation")

### highest_reputation Type

`boolean` ([Highest Reputation](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-highest-reputation.md))

## retired




`retired`

-   is optional
-   Type: `boolean` ([Retired a character](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-retired-a-character.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-retired-a-character.md "undefined#/properties/unlocked/properties/special_conditions/properties/retired")

### retired Type

`boolean` ([Retired a character](gloomhaven-properties-unlocked-content-properties-special-conditions-properties-retired-a-character.md))
