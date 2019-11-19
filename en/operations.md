# Operations

This section covers standards linked to operations.

## Environments

An API **MUST** be deployed to a QA (also called UAT) environment before being pushed to production.

If more environments are required, an API developer **SHOULD** follow existing DNS naming conventions (internal link) to name environments.

## Monitoring

### Monitoring API consumption

The team in charge of an API running in a production environment **SHOULD** ensure it is being monitored.

### Health check

An API **SHOULD** expose an endpoint to check its health status
```javascript
{
  "name": "Va.Api.Business.MyAwesomeProduct",
  "status": "up",
  "dependencies": {
    "Va.Api.Tech.Dependency1": {
      "depth": 1,
      "status": "up"
    },
    "Va.Api.Tech.SubDependency": {
      "depth": 2,
      "status": "up"
    }
  }
}
```
Furthermore, continous integration tools **COULD** use the healthcheck endpoint to confirm that the API is running correctly.


### Dependencies

In non-production environments, an API **SHOULD** expose an endpoint to list Vaudoise library dependencies being used.
```javascript
{
  "product": "Va.XCut.Back.Actuators.Core",
  "version": "1.0.0.13490",
  "libraries": [
    {
      "name": "Va.XCut.Api.Template.Application",
      "product": "Va.XCut.Api.Template",
      "version": "0.0.0.13490",
      "informationalVersion": "0.0.0",
      "configuration": "Debug"
    },
    {
      "name": "Va.XCut.Back.Logger.Std",
      "product": "Va.XCut.Back.Logger.Std",
      "version": "1.0.0.13490",
      "informationalVersion": "1.0.0-Beta01",
      "configuration": "Debug"
  ]
}
```

### Hosting

In non production environments, an API **SHOULD** expose an endpoint to give basic information about the hosting server.
```javascript
{
  "machineDomain": "VAUDOISE",
  "machineName": "DEVABCDEF",
  "machineOS": "Microsoft Windows 10.0.10240 ",
  "machineProcessorCount": 8,
  "environmentName": ".NET Core 4.6.26606.02",
  "environmentArchitecture": "x64",
  "serviceName": "Va.XCut.Api.Template.Application",
  "serviceProcessId": 8752,
  "serviceStartTime": "2018-07-05T07:29:44.4771925+02:00",
  "serviceMemory": 92827648,
  "serviceThreads": 21
}
```