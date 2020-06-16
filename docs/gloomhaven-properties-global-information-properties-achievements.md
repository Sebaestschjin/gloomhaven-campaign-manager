# Achievements Schema

```txt
undefined#/properties/global/properties/achievements
```

The list of global achievements.


| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ----------------------- | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## achievements Type

`object[]` ([Achievement](gloomhaven-properties-global-information-properties-achievements-achievement.md))

## achievements Constraints

**unknown format**: the value of this string must follow the format: `table`

**unique items**: all items in this array must be unique. Duplicates are not allowed.
