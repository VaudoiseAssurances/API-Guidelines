# Nomenclature

This section covers standards linked to naming of resources, URIs, ...

## Global rules

### Naming conventions

APIs **MUST** be developed in english, **MUST NOT** contain acronyms and **MUST** use 'camelCase' convention (unless otherwise specified).

### Glossary

Field names **MUST** come from our business glossary (internal link), or be based on AFA's glossary (Specific Insurance Link).

## URI

Each URI **MUST** follow the [Standard naming conventions](#naming-conventions), except for 'camelCase'. Instead, a hyphen `-` **SHOULD** be used for compound words. Furthermore a URI **MUST NOT** end with a slash `/`.

### Examples

```
// Returns all people
GET https://MyHappyApi:8081/v2/people
// Returns person d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed

// Returns a list of children resources 'home-in-one' for person d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed/home-in-one
/// Returns the child resource 'home-in-one' 587d038d for person d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed/home-in-one/587d038d
  
// Returns current config
GET https://MyHappyApi:8081/v2/configuration
// Returns config for person d8a0f1ed
GET https://MyHappyApi:8081/v2/people/d8a0f1ed/configuration
```

## Versioning

The version of the API **SHOULD** be specified right after the server root segment and **MUST** match the first - _major_ - digit from the semantic version.
```
https://MyHappyApi:8081/v2/...
```
Furthermore for non production environments, the latest version **COULD ** be exposed through a _latest_ segment, i.e.
```
https://MyHappyApi:8081/latest/...
```
