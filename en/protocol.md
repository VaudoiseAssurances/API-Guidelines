# Protocole

Cette section traite des probl�matiques au niveau du protocole et de ses standards.

## HTTP

### Protocole HTTP

Toutes les API **DOIVENT** supporter le protocole HTTP et sa s�mantique.

### Codes HTTP
Quelques r�gles pour l'utilisation des codes HTTP, le d�veloppeur d'API

* **NE DOIT PAS** inventer des nouveaux codes HTTP ou d�river de leur sens originel,
* **DOIT** fournir une documentation de qualit� lors de l'utilisation de codes HTTP non-list�s ci-dessous.

#### 2XX Success

La requ�tes a �t� trait�e avec succ�s.

| Code | Definition |
|------|------------|
|200 OK | Succ�s de la requ�te |
|201 Created | Resource cr��e avec succ�s |
|202 Accepted | Requ�te accept�e mais non compl�t�e (process asynchrone...) |
|204 No content | Succ�s de la requ�te, r�ponse vide |
|206 Partial | R�sultat partiel (voir [pagination](#pagination)) |

#### 4XX Client Errors

La requ�te contenait une erreur de la part de l'appelant.

| Code | Definition |
|------|------------|
|400 Bad request | La requ�te n'est pas valide (syntaxe, taille,...) |
|401 Unauthorized | Le client n'est pas authentifi� |
|403 Forbidden | Le client ne poss�de pas des droits n�cessaires |
|404 Not found | La ressource demand�e n'existe pas |
|416 Range Not Satisfiable | Range Not Satisfiable |
|418 I'm a teapot | Une requ�te de caf� a �t� envoy� � une th�i�re |
|422 Business validation | Un �chec de la requ�te est du � une erreur de validation m�tier |

Remarque: dans le cas d'une collection vide, le r�sultat se doit d'�tre un 200 retournant un tableau vide. Le 404 n'est pas appropri� puisque, bien que vide, la collection existe.

#### 5XX Server Errors

Le serveur n'a pas pu traiter la requ�te.

| Code | Definition |
|------|------------|
|500 Internal server error | Une exception inattendue s'est produite |

## TLS

Une API utilisant le protocole HTTP **DEVRAIT** utiliser l'HTTPS.
