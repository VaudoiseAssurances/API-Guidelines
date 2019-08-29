# Message

This section covers governance about messages format.

## Data and description

### Encoding

Data **SHOULD** be encoded in UTF-8.

### Enum

Data **SHOULD** be represented as enumerations rather than as cryptic codes. In addition, enumeration positions **SHOULD** be serialized as a `camelCase` character to avoid mapping errors.

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

When a property can be expressed either as a data or as a display, the API **SHOULD** state it clearly.

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

The booleans properties name **MAY** be prefixed by `Is` or `Has` in order to make it clearer.

### Identifiers

For security reasons, technical identifiers **SHOULD** be non-sequential and non-deterministic, e.g., `UUID` v4 [RFC-4122](https://tools.ietf.org/html/rfc4122). 

### Common representation of business data

The API **SHOULD** be based on common representation of business data. For more information, have a look at our Représentation communes des données business (Internal link).

## Business validations

### Format of business validations

If the requests fails because of business validations, the response **SHOULD** use a 422 HTTP code, **SHOULD** have the following `Content-Type`
```
Content-type: application/vnd.va.validation+json
```
and **SHOULD** return this kind of payload
```javascript
{
    "validations": [      
        {
            // Field translated according the i18n/l10n and displayable to the user
            "display": "The name is required",
 
            // ValidationCode used to defined the label
            "code":"validationRequired",
 
            // Concerned field(s)
            "fields":["firstName"],
 
            // Variable data that are in the message (Validation property)
            "valParams":{}
        },
        {
            // Field translated according the i18n/l10n and displayable to the user
            "display": "Le npa devrait comporter au moins 42 caractères",
 
            // ValidationCode used to defined the label
            "code":"validationMinLength",
 
            // Concerned field(s)
            "fields":["address[0].npa"],
 
            // Variable data that are in the message (Validation property)
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

### Format of business errors

When a business operations fails, statuses **MUST** be in the 4XX, `Content-Type` **SHOULD** be 
```
Content-type: application/vnd.va.error+json
```
and the payload **SHOULD** look like
```javascript
{
    // Technical field
    "message": "This message will not be displayed to the user",
  
    // i18n/l10n field which can be displayed to the user
    "display": "If this error append again, please call your mama!",
      
    // Standard error code used by the client to define a specific label to display
    "code":"uniqueErrorCodeForDoesNotWork"
}
```

## Exception

## Exception format

On production environments, a software exception **MUST** return an HTTP status code 500 and **MUST NOT** return a stack trace.

On non-production environments, the payload **SHOULD** look like
```javascript
Content-type: application/vnd.va.exception+json
{
    // Champs techniques habituels
    "message": "object not set to an instance",
    "stackTrace": "...",
    "innerException": {...}
}
```

## Payload JSON

### Format - négociation de contenu

Les payloads **DEVRAIENT** être retournées au format application/json et **DOIVENT** respecter les conventions de ce format (`camelCase`, etc). Un service **PEUT** traiter d'autres formats (xml, yml) via le header standard Accept.

### JSON'ception

Les propriétés contenues dans une payload JSON **NE DOIVENT PAS** contenir elles-mêmes du json ou du xml. 
