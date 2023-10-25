Every team is accountable to respect these standards during API development, and every member is encouraged to work collaboratively with members of the API Community of Practice to improve these guidelines.

In the case of an evolution of these API standards, the following rules must be followed:

* Existing APIs should not be systematically changed, although this is advisable,
* New APIs must respect the current version of the standards.

This document uses the terms **RIGHT**, **SHOULD**, **MUST**, **MUST** as keywords to define the requirement levels of a specification as defined in [RFC 2119](http://microformats.org/wiki/rfc-2119).

# Table des matières

* [Basic Principles](basic-principles.md)
  * [API First](basic-principles.md#api-first)
  * [Compatibility](basic-principles.md#compatibilité)
  * [Documentation](basic-principles.md#documentation)
  * [REST](basic-principles.md#rest)
* [Message](message.md)
  * [Data and representation](message.md#données-et-représentations)
  * [Business validations](message.md#validations-métiers)
  * [Business errors](message.md#erreurs-métiers)
  * [Exceptions](message.md#exception)
  * [JSON Payload](message.md#payload-json)  
* [Request](requête.md)
  * [Asynchronisme](request.md#asynchronisme)
  * [Impersonation](request.md#impersonation)
  * [Localisation](request.md#localisation)
  * [Pagination](request.md#pagination)
* [Nomenclature](nomenclature.md)
  * [General rules](nomenclature.md#règles-générales)
  * [URI](nomenclature.md#uri)
  * [Versioning](nomenclature.md#versioning)
* [Protocole](protocol.md)
  * [HTTP](protocol.md#http)
  * [TLS](protocol.md#tls)
* [Security](security.md)
* [Exploitation](operations.md)
  * [Environnements](operations.md#environnements)
  * [Monitoring](operations.md#monitoring)
