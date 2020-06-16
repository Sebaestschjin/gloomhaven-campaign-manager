# Available Scenarios Schema

```txt
undefined#/properties/global/properties/scenarios
```

The list of available scenarios. Locked scenarios are the ones that currently can't be started e.g. because a global achievement prevents that.


| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                       |
| :------------------ | ---------- | -------------- | ----------------------- | :---------------- | --------------------- | ------------------- | -------------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [gloomhaven.schema.json\*](../out/gloomhaven.schema.json "open original schema") |

## scenarios Type

`object` ([Available Scenarios](gloomhaven-properties-global-information-properties-available-scenarios.md))

## scenarios Constraints

**maximum number of properties**: the maximum number of properties for this object is: `115`

# Available Scenarios Properties

| Property              | Type     | Required | Nullable       | Defined by                                                                                                                                                                                      |
| :-------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Additional Properties | `string` | Optional | cannot be null | [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-available-scenarios-additionalproperties.md "undefined#/properties/global/properties/scenarios/additionalProperties") |

## Additional Properties

Additional properties are allowed, as long as they follow this schema:




-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [Gloomhaven Campaign](gloomhaven-properties-global-information-properties-available-scenarios-additionalproperties.md "undefined#/properties/global/properties/scenarios/additionalProperties")

### additionalProperties Type

`string`

### additionalProperties Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value      | Explanation |
| :--------- | ----------- |
| `"Open"`   |             |
| `"Done"`   |             |
| `"Locked"` |             |
