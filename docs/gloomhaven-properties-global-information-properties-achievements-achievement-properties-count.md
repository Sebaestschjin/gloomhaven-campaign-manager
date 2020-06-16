# Count Schema

```txt
undefined#/properties/global/properties/achievements/items/properties/count
```

Some achievements can be gotten multiple times.


| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ----------------------- | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## count Type

`integer` ([Count](gloomhaven-properties-global-information-properties-achievements-achievement-properties-count.md))

## count Constraints

**maximum**: the value of this number must smaller than or equal to: `5`

## count Default Value

The default value is:

```json
1
```
