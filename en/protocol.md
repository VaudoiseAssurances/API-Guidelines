# Protocol

This section addresses issues related to the protocol and its standards.

## HTTP

### HTTP Protocol

All APIs **MUST** support the HTTP protocol and its semantics.

### HTTP Codes

Some rules for the use of HTTP codes, the API developer

* **MUST NOT** invent new HTTP codes or derive from their original meaning,
* **MUST** provide high quality documentation when using HTTP codes not listed below.

#### 2XX Success

The request was processed successfully.

| Code | Definition |
|------|------------|
|200 OK | Request successful |
|201 Created | Resource created successfully|
|202 Accepted | Request accepted but not completed (asynchronous process...) |
|204 No content | Request successful, empty response |
|206 Partial | Résultat partiel (voir [pagination](#pagination)) |

#### 4XX Client Errors

The request contained an error from the consumer.

| Code | Definition |
|------|------------|
|400 Bad request | The request is not valid (syntax, size, ...) |
|401 Unauthorized | The client is not authenticated |
|403 Forbidden | The customer does not have the necessary rights |
|404 Not found | The requested resource does not exist |
|416 Range Not Satisfiable | Range Not Satisfiable |
|418 I'm a teapot | A request for coffee was sent to a teapot |
|422 Business validation | A request failed due to a business validation error |

Note: in the case of an empty collection, the result must be a 200 returning an empty array. The 404 is not appropriate since, although empty, the collection exists.

#### 5XX Server Errors

The server couldn't process the request.

| Code | Definition |
|------|------------|
|500 Internal server error | An unexpected exception occurred. |

## TLS

An API using the protocol HTTP **SHOULD** use HTTPS.
