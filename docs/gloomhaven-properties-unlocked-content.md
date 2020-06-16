# Unlocked content Schema

```txt
undefined#/properties/unlocked
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## unlocked Type

`object` ([Unlocked content](gloomhaven-properties-unlocked-content.md))

# Unlocked content Properties

| Property                                  | Type     | Required | Nullable       | Defined by                                                                                                                                                    |
| :---------------------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [classes](#classes)                       | `array`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-character-classes.md "undefined#/properties/unlocked/properties/classes")             |
| [items](#items)                           | `array`  | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-reward-items.md "undefined#/properties/unlocked/properties/items")                    |
| [special_conditions](#special_conditions) | `object` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions.md "undefined#/properties/unlocked/properties/special_conditions") |

## classes

The list of unlocked character classes. If a member of the party uses an unlockable class it MUST also be provided here.


`classes`

-   is optional
-   Type: `string[]` ([Class](gloomhaven-properties-unlocked-content-properties-character-classes-class.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-character-classes.md "undefined#/properties/unlocked/properties/classes")

### classes Type

`string[]` ([Class](gloomhaven-properties-unlocked-content-properties-character-classes-class.md))

## items

The names of reward items unlocked. Those will be added to the store. The item can come from the rewards deck or the item design deck.


`items`

-   is optional
-   Type: `string[]` ([Item](gloomhaven-properties-unlocked-content-properties-reward-items-item.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-reward-items.md "undefined#/properties/unlocked/properties/items")

### items Type

`string[]` ([Item](gloomhaven-properties-unlocked-content-properties-reward-items-item.md))

## special_conditions

Track of special conditions that must be met to unlock certain game components


`special_conditions`

-   is optional
-   Type: `object` ([Special conditions](gloomhaven-properties-unlocked-content-properties-special-conditions.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-unlocked-content-properties-special-conditions.md "undefined#/properties/unlocked/properties/special_conditions")

### special_conditions Type

`object` ([Special conditions](gloomhaven-properties-unlocked-content-properties-special-conditions.md))
