# Security  

There are two types of APIs: those that have security criteria, and those that do not.

An API is considered to have security criteria if the answer to at least one of the following 3 questions is “yes”:
  1. _Visibility_: Is the API exposed to outside of Vaudoise ?
  2. _Data Type_: Does the API allow access to restricted or confidential data according to Vaudoise confidentiality definition levels ?
  3. _Data Access_: Does the API allow data creation, modification or deletion ?

These questions and their answers *MUST* be included in the documentation of each API (see General Documentation chapter). Documentation *MUST* also indicate if the API _present security issues_.

If an API has security criteria, then the following requirements *MUST* be met.
 
  - Integration into the API manager (mandatory if the API is exposed to the Internet, recommended otherwise)   
  - Rights managed up to the method level and not just at the API level, And the access model to be documented  (IAM sheet) (covered by the API Manager)   
  - Authenticated API calls using tokens (covered by API Manager)   
  - Logging – API calls must be logged and kept for 90 days (covered by the API Manager, with checks for log management and service logs)   
  - Periodic rights control (CPA) implemented by regular reviews of access given on the API to end users in the API Manager

If they are, the tag “API secured” *MUST* be set to “Yes” in the Wiki page documenting the API.
