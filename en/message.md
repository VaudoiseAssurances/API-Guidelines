# Message

This section covers governance about the structure of messages.

## Data and description

### Encoding

Data **SHOULD** be encoded in UTF-8.

### Enums

Data **SHOULD** be displayed as enumerations rather than cryptic codes. Also, enumeration positions **SHOULD** be serialized as `camelCase` characters to avoid mapping errors.

```javascript
Content-type: application/x.va.validation+json
{
    // No ambiguity
    "title":"baron"
      
    // Risk of mapping error
    "title": 4
}
```

### Data and display

When a property can be conveyed either as raw data or as data ready to be displayed, the API **SHOULD** state it clearly.

```javascript
Content-type: application/x.va.validation+json
{
    // By default, it is data
    "myDateTime": "1997-09-02T19:20:30.45+01:00", 

    // Is it long enough ? Explain when it is a displayable property
    "myDateTimeDisplay": "Monday 2 September at 7pm 20mn 30sec",
 
    "myDate": "1985-08-09", // By default, it is data
    "myDateDisplay": "Vendredi 9 août 1985", // Explain when it is displayable (and the birthday of Jérôme Freyre)
      
    "gender":"M",
    "genderDisplay":"Male"
}
```

### Booleans

Booleans properties name **MAY** be prefixed by `is` or `has` in order to make it intuitive.

### Identifiers

For security reasons, technical identifiers **SHOULD** be non-sequential and non-deterministic, e.g., `UUID` v4 [RFC-4122](https://tools.ietf.org/html/rfc4122). 

### Identical representation of business data

The API **SHOULD** be based on identical representation of business data. For more information, have a look at our Représentation communes des données business (Internal link).

## Business validations

### Format of business validations

When a request fails because of business validations, it **SHOULD** respond a 422 HTTP code, **SHOULD** have the following `Content-Type`
```
Content-type: application/vnd.va.validation+json
```
and **SHOULD** return this kind of payload
```javascript
{
    "validations": [      
        {
            // Field translated according the i18n/l10n and visible to the user
            "display": "The name is required",
 
            // ValidationCode used to configure the label
            "code":"validationRequired",
 
            // Related field(s)
            "fields":["firstName"],
 
            // Variable value constraint (Validation property)
            "valParams":{}
        },
        {
            // Field translated according the i18n/l10n and visible to the user
            "display": "Le npa devrait comporter au moins 42 caractères",
 
            // ValidationCode used to configure the label
            "code":"validationMinLength",
 
            // Related field(s)
            "fields":["address[0].npa"],
 
            // Variable value constraint (Validation property)
            "valParams":{
                "min": 42
            }
        },
        {
            ...
        }
    ]
}
```

## Business errors

### Structure of business errors

When a business operation fails, the response status **MUST** be in the range of 4XX, `Content-Type` **SHOULD** be 
```
Content-type: application/vnd.va.error+json
```
and the payload **SHOULD** be similar to
```javascript
{
    // Technical field
    "message": "This message will not be displayed to the user",
  
    // i18n/l10n field which can be displayed to the user
    "display": "If this error occurs again, please call your mama!",
      
    // Standard error code used client-side to define a specific label to display

    "code":"uniqueErrorCodeForDoesNotWork"
}
```

## Exception

## Exception structure

On production environments, software exceptions **MUST** return an HTTP status code 500 and **MUST NOT** return a stack trace.

On non-production environments, payloads **SHOULD** be similar to
```javascript
Content-type: application/vnd.va.exception+json
{
    // Usual technical fields
    "message": "object not set to an instance",
    "stackTrace": "...",
    "innerException": {...}
}
```

## JSON Payload

### Format - content negociation

Payloads **SHOULD** be returned in the `application/json` format and **MUST** comply with its conventions (`camelCase`, etc). A webservice **MAY** process other formats (such as xml, yml) via the standard `Accept` header.

### JSON'ception

Properties contained in a JSON **MUST NOT** contain JSON or XML themselves.
