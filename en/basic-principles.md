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

An API **MUST** be documented in a Wiki and **MUST** contain at least the following:

* a full description
* the team in charge of the API
* a link to the swagger documentation

This Wiki page **MUST** be added to our internal directory.

_Nota Bene : Our API community of practice is aware that this solution is temporary. In the future, we will have a centralised directory such as an API Management._

### Documentation

An API **MUST** provide a full, explicit and up-to-date documentation of its endpoints and **SHOULD** expose it as a Swagger.

## REST

### Resources instead of Verbs

APIs **MUST** be designed around resources and **MUST** not represent actions. An API **MAY** include hypermedia (HATEOAS).

#### Maturity level

Ideally, we are aiming for Richardson's second maturity level, however it is possible to use level 3. Further information is available on https://martinfowler.com/articles/richardsonMaturityModel.html.

REST is based on entities/resources and usage of standard HTTP methods (such as GET/POST/PUT/DELETE) as operations. URLs **MUST** contain names and no verb.

For example, instead of having the verb _cancel_ in the URL, it is preferrable to use the resource _cancellation_.

### Use of verbs

Standard HTTP methods are not meaningless: they **MUST** be used to specify the type of action required.

Although these methods are not equivalent to CRUD, it is preferable, in our case, to use them as they are for simplification purposes and to keep only non idempotent creations.

| Method   | Action    | Definition |          |
|-----------|-----------|------------|----------|
| POST      | Non-idempotent | Create a resource| C |
| GET      | Nullipotent (Safe) | Get one (or many) resource(s) | R |
| PUT      | Idempotent | Update a ressource | U |
| DELETE      | Idempotent | Delete a resource | D |

#### POST

* A POST (create, in our case) successfully executed will return a 201. The header **MUST** contain `Location` with a link to the newly created entity.
* Asynchronous operations **MUST** return a 202 containing a header `Location` in order to monitor the operation.

#### GET

* A successful GET returns a resource and a 200.
* A successful GET returns multiple resources and a 200 if all resources are present or a 206 if some of the resources are returned (paging, top n). In this case, the response **MUST** contain a `Content-Range` header.

#### PUT

* A successful PUT (update, in our case) returns a 200 or a 204.
* Asynchronous operations **MUST** return a 202 containing a `Location` header to monitor the status of the operation.

#### DELETE

* A successful DELETE returns a 200 or a 204.
* Asynchronous operations **MUST** return a 202 containing a `Location` header to monitor the status of the operation.
