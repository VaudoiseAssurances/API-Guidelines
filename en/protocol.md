# Protocole

Cette section traite des problématiques au niveau du protocole et de ses standards.

## HTTP

### Protocole HTTP

Toutes les API **DOIVENT** supporter le protocole HTTP et sa sémantique.

### Codes HTTP
Quelques règles pour l'utilisation des codes HTTP, le développeur d'API

* **NE DOIT PAS** inventer des nouveaux codes HTTP ou dériver de leur sens originel,
* **DOIT** fournir une documentation de qualité lors de l'utilisation de codes HTTP non-listés ci-dessous.

#### 2XX Success

La requêtes a été traitée avec succès.

| Code | Definition |
|------|------------|
|200 OK | Succès de la requête |
|201 Created | Resource créée avec succès |
|202 Accepted | Requête acceptée mais non complétée (process asynchrone...) |
|204 No content | Succès de la requête, réponse vide |
|206 Partial | Résultat partiel (voir [pagination](#pagination)) |

#### 4XX Client Errors

La requête contenait une erreur de la part de l'appelant.

| Code | Definition |
|------|------------|
|400 Bad request | La requête n'est pas valide (syntaxe, taille,...) |
|401 Unauthorized | Le client n'est pas authentifié |
|403 Forbidden | Le client ne possède pas des droits nécessaires |
|404 Not found | La ressource demandée n'existe pas |
|416 Range Not Satisfiable | Range Not Satisfiable |
|418 I'm a teapot | Une requête de café a été envoyé à une théière |
|422 Business validation | Un échec de la requête est dû à une erreur de validation métier |

Remarque: dans le cas d'une collection vide, le résultat se doit d'être un 200 retournant un tableau vide. Le 404 n'est pas approprié puisque, bien que vide, la collection existe.

#### 5XX Server Errors

Le serveur n'a pas pu traiter la requête.

| Code | Definition |
|------|------------|
|500 Internal server error | Une exception inattendue s'est produite |

## TLS

Une API utilisant le protocole HTTP **DEVRAIT** utiliser l'HTTPS.
