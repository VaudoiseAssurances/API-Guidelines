# Basic principles

This section covers the basic principles.

## API First

### Design API before implementation

The signature of the API -- also called interface or contract -- **MUST** be done before the implementation (OpenAPI specification, Stub, etc).

The goal is to allow people to give feedbacks as soon as possible and an internal discipline that focuses on :

* the knowledge of the functional domain,
* entities and business resources, i.e., avoid having APIs for specific use-cases,
* a real separation between the WHAT and the HOW

**The API contrat is the unique source of truth and not the implementation.** If you development langage does not support natively the generation of the documentation, then it is possible to write the documentation by hand.

The implementation of an API **MUST** always be consistent with the description of the API : this represents the contract between the API and the consumers.

## Compatibility

### Do not break backward compatibility

API updates in the same major version **MUST NOT** break backward compatibility. APIs are a contract between the consumers and the producer that cannot be broken by unilateral decisions.

There are two possibilities to update an API without breaking it :

* follow the compatible extension rules,
* introduce a new version of the API while supporting the old version.

### Rules to extand an API

Every minor modifications of an API **MUST** follow the extension rules :

* **MUST NOT** remove fields/properties,
* **MUST NOT** add mandatory fields,
* **MUST NOT** delete an existing endpoint,
* Everything that is added **MUST** be optional.

If any of these rules cannot be respected for any reason, then we **MUST** deploy a new major version.

## Documentation

### Documentation générale

Une API **DOIT** faire l'objet d'une documentation sous forme d'une page dans notre Wiki d'entreprise contenant au moins:

* Un descriptif
* L'équipe responsable clairement identifiée
* Lien vers les documentations Swagger

Cette page wiki **DOIT** être ajoutée à l'annuaire.

_Nota Bene : La communauté de l'API est tout à fait consciente que cette solution est temporaire. A terme, nous nous attendons à avoir un service registry centralisé, probablement dans un outil d'API Management._

### Documentation

Une API **DOIT** exposer une documentation explicite, complète et à jour de ses endpoints et **DEVRAIT** l'exposer sous forme d'un Swagger.

## REST

### Ressources au lieu de verbe

Les APIs **DOIVENT** être designées autour des ressources, et **NE DOIVENT PAS** représenter des actions. Une API **PEUT** inclure les contrôles hypermedia (HATEOAS).

#### Niveau de maturité

Idéalement, nous visons le niveau 2 du modèle de maturité de Richardson, mais il est tout à fait possible d'utiliser le niveau 3. Plus d'informations disponibles sur https://martinfowler.com/articles/richardsonMaturityModel.html.

REST est centralisé autour des entités/ressources et l'utilisation des méthodes HTTP standards (tq. GET/POST/PUT/DELETE) en tant qu'opérations. Les URLs ne doivent contenir que des noms, et non pas des verbes.

Par exemple, au lieu d'avoir le verbe annuler dans l'URL, il faut plutôt penser à la ressource annulation.

### Utilisation des verbes

Les méthodes Http standard ont une signification, elles sont à utiliser pour déterminer le type d'action à effectuer.

Bien que ces méthodes ne soient pas équivalentes à du CRUD, il est préférable dans notre cas de les utiliser comme tel à des fins de simplification et de ne garder que des créations non idempotentes.

| Méthode   | Action    | Définition |          |
|-----------|-----------|------------|----------|
| POST      | Non-idempotent | Créer une resource | C |
| GET      | Nullipotent (Safe) | Retourner une/des resource(s) | R |
| PUT      | Idempotent | Modifier une ressource | U |
| DELETE      | Idempotent | Supprimer une resource | D |

#### POST
* Un POST (create, dans notre cas) exécuté avec succès retourne un 201. Le header doit contenir un header `Location` donnant le lien vers la nouvelle entité.
* Dans le cas d'une opération asynchrone, la réponse doit être un 202 contenant un header `Location` permettant de monitorer l'état de l'opération.

#### GET

* Un GET retournant une ressource exécutée avec succès retourne un 200.
* Un GET retournant plusieurs ressources avec succès retourne un 200 si toutes les ressource sont présentes ou un 206 si une partie des ressources est retournée (paging, top n). Dans ce cas-là, la réponse doit contenir un header `Content-Range`. 

#### PUT

* Un PUT (update, dans notre cas) exécutée avec succès retourne un 200 ou un 204.
* Dans le cas d'une opération asynchrone, la réponse doit être un 202 contenant un header `Location` permettant de monitorer l'état de l'opération.

#### DELETE

* Un DELETE exécuté avec succès retourne un 200 ou un 204.
* Dans le cas d'une opération asynchrone, la réponse doit être un 202 contenant un header `Location` permettant de monitorer l'état de l'opération.
