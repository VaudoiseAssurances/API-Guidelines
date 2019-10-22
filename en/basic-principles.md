# Basic principles

This section covers the basic principles.

## API First

### Design API before implementation

The signature of the API -- also called interface or contract -- **MUST** be done before implementation (OpenAPI specification, Stub, etc).

The goal is to allow stakeholders to give early feedback and to show self-discipline by focusing on:

* knowledge of the functional domain and the common requirements,
* entities and business resources, i.e. avoid having APIs for specific use-cases,
* a clear divide between the WHAT and the HOW

**The API contract is the unique source of truth, not the implementation.** If your development language does not support automatic creation of documentation, you **SHOULD** write the documentation manually.

The implementation of an API **MUST** always be consistent with its description : it represents the contract between the API and the consumers.

## Compatibility

### Do not break backward compatibility

API updates in the same major version **MUST NOT** break backward compatibility. An API is a contract between the consumers and the producer which cannot be broken by unilateral decisions.

There are two ways to update an API without breaking it:

* follow the compatible extension rules,
* introduce a new version of the API while maintaining the previous versions.

### Rules to extand an API

Each new minor version of an API **MUST** follow these extension rules:

* **MUST NOT** remove fields/properties,
* **MUST NOT** make mandatory fields that were initially described as optional,
* **MUST NOT** delete an existing endpoint,
* Every new addition to a minor version **MUST** be optional.

If, for any reason, these rules cannot be followed, then a new major version **MUST** be deployed.

## Documentation

### General documentation

Each API **MUST** be documented in our company's Wiki on a page with:

* a description
* the team in charge of the API
* a link to the swagger documentation

This wiki page **MUST** be added to our directory.

_Nota Bene : Our API community of practice is aware that this solution is temporary. In the future, we will have a centralised directory such as an API Management._

### Documentation

An API **MUST** expose an explicit documentation, full and up to date of its endpoints and **SHOULD** expose it as a Swagger.

## REST

### Ressources instead of Verbs

APIs **MUST** be designed around resources and **MUST** not represent actions. An API **MAY** include hypermedia (HATEOAS).

#### Maturity level

Idealy, we aim for the second maturity level of Richardson, but it is possible to use the level 3. More information are available on https://martinfowler.com/articles/richardsonMaturityModel.html.

REST is based around entities/resources and the use of standards HTTP methods (such as GET/POST/PUT/DELETE) as operations. URLs **MUST** have names and no verb.

For example, instead of having the verb _cancel_ in the URL, it is expected to have the resource _cancellation_.

### Use of verbs

Standard HTTP methods have a meaning, they have to be used to specify the type of action to do.

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
