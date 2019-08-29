# Basic principles

This section covers the basic principles.

## API First

### Design API before implementation

The signature of the API -- also called interface or contract -- **MUST** be done before the implementation (OpenAPI specification, Stub, etc).

The goal is to allow people to give feedbacks as soon as possible and an internal discipline that focuses on :

* the knowledge of the functional domain,
* entities and business resources, i.e., avoid having APIs for specific use-cases,
* a real separation between the WHAT and the HOW

**The API contract is the unique source of truth and not the implementation.** If you development langage does not support natively the generation of the documentation, then it is possible to write the documentation by hand.

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

### General documentation

An API **MUST** have a documentation in our enterprise Wiki that is a page with :

* a description
* the team in charge of the API
* a link to the swagger documentation

This wiki page **MUST** be added to our directory.

_Nota Bene : Our API community of practice is aware that this solution is temporary. Eventually we are going to have a centralised directory such as an API Management._

### Documentation

An API **MUST** expose an explicite documentation, full and up to date of its endpoints and **SHOULD** expose it as a Swagger.

## REST

### Ressources au lieu de verbe

APIs **MUST** be designed around resources, and **MUST** not represent actions. An API **MAY** include hypermedia (HATEOAS).

#### Maturity level

Idealy, we aim for the second maturity level of Richardson, but it is possible to use the level 3. More information are available on https://martinfowler.com/articles/richardsonMaturityModel.html.

REST is based around entities/resources and the use of standards HTTP methods (such as GET/POST/PUT/DELETE) as operations. URLs **MUST** have names and no verb.

For example, instead of having the verb _cancel_ in the URL, it is expected to have the resource _cancellation_.

### Use of verbs

Standard HTTP methods have a meaning, they have to be used to determine the type of action to do.

Although these methods are not equivalent to CRUD, it is preferable in our case to use them as such for simplification purposes and to keep only non idempotent creations.

| Method   | Action    | Definition |          |
|-----------|-----------|------------|----------|
| POST      | Non-idempotent | Create a resource| C |
| GET      | Nullipotent (Safe) | Get one (or many) resource(s) | R |
| PUT      | Idempotent | Update a ressource | U |
| DELETE      | Idempotent | Delete a resource | D |

#### POST
* A POST (create, in our case) executed with success returns a 201. The header has to contain `Location` with a link to the new entity.
* In the case of an asynchronous operation, the response has to be 202 with an header `Location` in order to monitor the operation.

#### GET

* A successful GET returns a resource and a 200.
* A successful GET returns multiple resources and a 200 if all resources are present or a 206 if some of the resources are returned (paging, top n). In this case, the response **MUST** contain a `Content-Range` header.

#### PUT

* A successful PUT (update, in our case) returns a 200 or a 204.
* In the case of an asynchronous operation, the response **MUST** be a 202 containing a `Location` header to monitor the status of the operation.

#### DELETE

* A successful DELETE returns a 200 or a 204.
* In the case of an asynchronous operation, the response **MUST** be a 202 containing a `Location` header to monitor the status of the operation.