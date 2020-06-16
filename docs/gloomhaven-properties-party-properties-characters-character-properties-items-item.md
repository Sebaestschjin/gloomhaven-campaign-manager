# Item Schema

```txt
undefined#/properties/party/properties/characters/items/properties/items/items
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## items Type

`object` ([Item](gloomhaven-properties-party-properties-characters-character-properties-items-item.md))

# Item Properties

| Property              | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                           |
| :-------------------- | -------- | -------- | -------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [name](#name)         | `string` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-name.md "undefined#/properties/party/properties/characters/items/properties/items/items/properties/name")         |
| [position](#position) | `string` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-position.md "undefined#/properties/party/properties/characters/items/properties/items/items/properties/position") |

## name




`name`

-   is optional
-   Type: `string` ([Name](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-name.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-name.md "undefined#/properties/party/properties/characters/items/properties/items/items/properties/name")

### name Type

`string` ([Name](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-name.md))

## position




`position`

-   is optional
-   Type: `string` ([Position](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-position.md))
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-position.md "undefined#/properties/party/properties/characters/items/properties/items/items/properties/position")

### position Type

`string` ([Position](gloomhaven-properties-party-properties-characters-character-properties-items-item-properties-position.md))

### position Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value          | Explanation |
| :------------- | ----------- |
| `"Head"`       |             |
| `"Armor"`      |             |
| `"HandLeft"`   |             |
| `"HandRight"`  |             |
| `"Boots"`      |             |
| `"Bag1"`       |             |
| `"Bag2"`       |             |
| `"Bag3"`       |             |
| `"Unequipped"` |             |
| `"Active1"`    |             |
| `"Active2"`    |             |
| `"Active3"`    |             |
| `"Active4"`    |             |
