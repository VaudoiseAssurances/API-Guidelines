# Request

This section covers query standards (i.e. filter, paging, sorting, asynchronism, etc).

## Asynchronism

During an operation conducted asynchronously by the server, the server **MUST** return an HTTP code 202 with a header Location giving the location of the URL to follow the operation. This URL will point to a resource of type operations.

```
Location: https://VaHappyHi:8081/v2/operations/8156ab4e
```

The `operation` resource **SHOULD**  contain the current state of the operation (`notStarted`, `running`, `succeeded`, `failed`).

* If the status is `notStarted` or `running`, then the return code **MUST** be 202 and the header location remains the same,
* If the status is `notStarted` or `running`, then the header Retry-After **SHOULD**  indicate the number of seconds to wait before checking the status of the operation,
* If the state is `succeeded`, then the return code **MUST** be 200 and the header location should now return the location of the resource in question.

## Impersonation

The impersonation implementation **SHOULD NOT** be implemented only at customer level, but **SHOULD** be at API level. Impersonation **SHOULD** be done using a custom header:

```
Va-Impersonate: sio
```

The API **SHOULD** log the fact that the action was performed by user A impersonating user B.

## JSON Patch

The update of an object can be done via an http request `PUT`. In addition, use of `PATCH' is possible using the operations described in [RFC-6902](https://tools.ietf.org/html/rfc6902) (**JavaScript Object Notation (JSON) Patch**).

We **SHOULD**  only use the add, remove and replace operations. Other operations described in the RFC **SHOULD NOT** be used.

```
if an object is
{ firstName:"Albert", contactDetails: { phoneNumbers: [] } };

and we apply the following operations:
[
  { op:"replace", path:"/firstName", value:"Joachim" },
  { op:"add", path:"/lastName", value:"Wester" },
  { op:"add", path:"/contactDetails/phoneNumbers/0", value: { number:"555-123" }  }
];

The object MUST be transformed into
{ firstName:"Joachim", lastName:"Wester", contactDetails: { phoneNumbers: [{number:"555-123"}] } };
```

**Warning**, it has been noted that the swagger may not be generated correctly. In this case, it **MUST** contain a textual description describing that it is a json-patch operation and what type of object it accepts.

## Localisation

The desired language **SHOULD** be set using the `Accept-Language` header and **COULD** contain either a language with locale (fr-CH) or a language alone (FR).

Please note that the content of the JSON payload as well as the parameters transmitted in the URL **MUST** be formatted according to the JSON standard.

### Exemple

HTTP Request
```
GET /contracts HTTP/1.1
Accept-Language: fr-ch, de-ch
```

HTTP Response
```
HTTP/1.1 200 OK
Content-Type: [...]
Content-Language: fr-ch


[...]
```

## Paging

Access to data lists **MUST** support paging for a better consumer experience. This is true for all lists that are potentially larger than a few hundred records.

There are two types of iteration techniques:

* Offset/Limit-based,
* Cursor-based.

It is important to take into account the way pagination is used by the consumers. It seems that direct access to a specific page is less used than navigation via links of the type _next page/previous page_. Therefore, it is better to favour _cursor-based_ pagination.

In all cases, we **MUST** start pagination at 0.
