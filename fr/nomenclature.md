# Nomenclature

Cette section couvre les standards liés aux nomenclatures des ressources, URI, etc.

## Règles générales

### Règles générales de nommage

Le développement d'API **DOIT** se faire en anglais, **NE DOIT PAS** contenir d'acronyme et **DOIT** utiliser le `camelCase` (sauf indication contraire).

### Lexique

Les noms **DOIVENT** provenir du Glossaire métier (Internal link), et dans un deuxième temps, se baser sur le référentiel de l'AFA (Specific Insurance Link).

## URI

Chaque URI DOIT suivre les [Règles générales de nommage](#règles-générales-de-nommage), à part pour le `camelCase`. A la place, un tiret  `-`  **DEVRAIT** être utilisé pour délimiter les mots composés. De plus, une URI **NE DOIT PAS** terminer avec un slash  `/`.

### Exemples

```http
// Retourne toutes les personnes
GET https://MyHappyApi:8081/v2/people
// Retourne la personne d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed

// Retourne la liste des sous resources home in one de la personne d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed/home-in-one
// Retourne la sous resource home in one 587d038d de la personne d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed/home-in-one/587d038d

// Retourne la configuration actuelle
GET https://MyHappyApi:8081/v2/configuration
// Retourne la configuration de la personne d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed/configuration
```

## Versioning

La version de l'API **DEVRAIT** être spécifiée dans le segment d'url suivant le root du serveur et **DOIT** représenter le premier digit – _majeur_ – de la version sémantique.

```http
https://MyHappyApi:8081/v2/...
```

De plus, sur les environnements de développement non-productif, la dernière version **POURRAIT** être accessible par le segment latest, i.e.,

```http
https://MyHappyApi:8081/latest/...
```
