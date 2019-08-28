# Message

Cette section couvre la gouvernance sur le format des messages.

## Données et représentations

### Encodage

Les données **DEVRAIENT** être encodées en UTF-8.

### Enumérations

Les données **DEVRAIENT** être représentées sous forme d'énumérations plutôt que sous forme de codes cryptiques. De plus, les positions d'énumérations **DEVRAIENT** être sérialisées sous forme de chaîne de caractères en `camelCase` afin d'éviter les erreurs de mapping.

```javascript
Content-type: application/x.va.validation+json
{
    // Pas d'ambiguité
    "titre":"baron"
      
    // Risque d'erreur de mapping, risque de dérive en maintenance évolutive
    "titre": 4
}
```

### Données et affichage

Lorsqu'une propriété peut être exprimée soit sous forme de données, soit sous forme d'affichage, l'API **DEVRAIT** l'énoncer clairement.

```javascript
Content-type: application/x.va.validation+json
{
    "myDateTime": "1997-09-02T19:20:30.45+01:00", // Par défaut, de la data
    "myDateTimeDisplay": "Lundi 2 septembre à 19heures 20 minutes 30 secondes 45 centièmes, et dans le fuseau horaire GM+1", // Expliciter lorsqu'il s'agit de display. C'est assez long ?
 
    "myDate": "1985-08-09", // Par défaut, de la data
    "myDateDisplay": "Vendredi 9 août 1985", // Expliciter lorsqu'il s'agit de display et de l'anniversaire à JFR
      
    "gender":"M",
    "genderDisplay":"Male"
}
```

### Booléens

Le nom des propriétés booléennes **POURRAIT** être préfixé par `Is` ou `Has` afin de rendre la nature du champ plus claire.

### Identifiant

Pour des raisons de sécurité, les identifiants techniques exposés **DEVRAIENT** être non-séquentiels et non-déterministes, par exemple, `UUID` v4 [RFC-4122](https://tools.ietf.org/html/rfc4122). 

### Représentation commune des données business

L'API **DEVRAIT** se baser sur la représentation commune des données business. Pour plus d'informations, consulter Représentation communes des données business (Internal link).

## Validations métiers

### Format des validations métiers

En cas d'un échec de la requête pour des raisons de validation métier, la réponse **DEVRAIT** utiliser un code HTTP 422, **DEVRAIT** avoir un Content-Type clairement défini
```
Content-type: application/vnd.va.validation+json
```
et **DEVRAIT** retourner une payload avec
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

## Erreurs métiers

### Format des erreurs métiers

Lors de l'échec d'une opération métier, les statuts **DOIVENT** être de l'ordre de 4XX, le `Content-Type` **DEVRAIT** être 
```
Content-type: application/vnd.va.error+json
```
et le contenu de la payload **DEVRAIT** être
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

## Format des exceptions

Sur l'environnement de production, une exception logicielle **DOIT** retourner un code HTTP 500 et **NE DOIT PAS** retourner de stack trace.

Sur les environnements non productifs, la payload retournée **DEVRAIT** ressembler à

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
