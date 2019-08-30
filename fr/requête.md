# Requête

Cette section couvre les standards liés aux requêtes (i.e. filtre, pagination, tri, asynchronisme, etc).

## Asynchronisme

Lors d'une opération conduite de manière asynchrone par le serveur, celui-ci **DOIT** retourner un code HTTP 202 avec un header Location désignant l'emplacement de l'URL de suivi de l'opération. Cet URL pointera sur une ressource de type operations.

```http
Location: https://VaHappyHi:8081/v2/operations/8156ab4e
```

La ressource `operation` **DEVRAIT** contenir l'état actuel de l'opération (`notStarted`, `running`, `succeeded`, `failed`). 

* Si l'état est `notStarted` ou `running`, alors le code de retour **DOIT** être 202 et le header location reste le même,
* Si l'état est `notStarted` ou `running`, alors le header Retry-After **DEVRAIT** indiquer le nombre de secondes à attendre avant de vérifier l'état de l'opération,
* Si l'état est `succeeded`, alors le code de retour **DOIT** être 200 et le header location doit désormais retourner l'emplacement de la ressource en question.

## Impersonation

L'implémentation de l'impersonation **NE DEVRAIT PAS** être implémentée uniquement au niveau du client, mais **DEVRAIT** être au niveau de l'API. L'impersonation **DEVRAIT** se faire au moyen d'un header custom:

```http
Va-Impersonate: sio
```

L'API **DEVRAIT** logguer le fait que l'action a été effectuée par un utilisateur A impersonant un utilisateur B.

## Localisation

La langue désirée **DEVRAIT** être définie en utilisant le header `Accept-Language`.

A noter que le contenu de la payload JSON ainsi que les paramètres transmis dans l'URL **DOIVENT** être formatés selon le standard JSON.

### Exemple

HTTP Request

```http
GET /contracts HTTP/1.1
Accept-Language: fr-ch, de-ch
```

HTTP Response

```http
HTTP/1.1 200 OK
Content-Type: [...]
Content-Language: fr-ch

[...]
```

## Pagination

L'accès à des listes de données **DOIT** supporter la pagination pour une meilleure expérience du côté du consommateur. Cette affirmation est vraie pour toutes les listes qui sont potentiellement plus grandes que quelques centaines d'enregistrements.

Il existe deux types de techniques d'itération:

* Offset/Limit-based,
* Cursor-based.

Il est important de prendre en compte la façon dont est utilisée la pagination c/o les consommateurs. Il semblerait que l'accès direct à une page spécifique est bien moins utilisé que la navigation via des liens de type _page suivante/page précédente_. De ce fait, il vaut mieux favoriser la pagination de type _cursor-based_.
