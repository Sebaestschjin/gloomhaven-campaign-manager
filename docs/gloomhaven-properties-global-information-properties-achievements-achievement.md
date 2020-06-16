# Achievement Schema

```txt
undefined#/properties/global/properties/achievements/items
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## items Type

`object` ([Achievement](gloomhaven-properties-global-information-properties-achievements-achievement.md))

# Achievement Properties

| Property        | Type      | Required | Nullable       | Defined by                                                                                                                                                                                            |
| :-------------- | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [name](#name)   | `string`  | Required | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-achievements-achievement-properties-name.md "undefined#/properties/global/properties/achievements/items/properties/name")   |
| [count](#count) | `integer` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-achievements-achievement-properties-count.md "undefined#/properties/global/properties/achievements/items/properties/count") |

## name

The name of the achievement


`name`

-   is required
-   Type: `string` ([Name](gloomhaven-properties-global-information-properties-achievements-achievement-properties-name.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-achievements-achievement-properties-name.md "undefined#/properties/global/properties/achievements/items/properties/name")

### name Type

`string` ([Name](gloomhaven-properties-global-information-properties-achievements-achievement-properties-name.md))

## count

Some achievements can be gotten multiple times.


`count`

-   is optional
-   Type: `integer` ([Count](gloomhaven-properties-global-information-properties-achievements-achievement-properties-count.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-achievements-achievement-properties-count.md "undefined#/properties/global/properties/achievements/items/properties/count")

### count Type

`integer` ([Count](gloomhaven-properties-global-information-properties-achievements-achievement-properties-count.md))

### count Constraints

**maximum**: the value of this number must smaller than or equal to: `5`

### count Default Value

The default value is:

```json
1
```
