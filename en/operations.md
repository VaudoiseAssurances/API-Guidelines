# Operations

This section covers standards linked to operations. Those standards are simply the actuator standards. Keep the actuator standards simplify the alignement of all applications in VA ecosystem.

## Environments

An API **MUST** be deployed to a UAT environment before being pushed to production.

If more environments are required, an API developer **SHOULD** follow existing DNS naming conventions (internal link) to name environments.

## Monitoring

### Monitoring API consumption

The team in charge of an API running in a production environment **SHOULD** ensure it is being monitored.

### Health check

An API **SHOULD** expose an endpoint to check its health status

The parent path ```/health``` **SHOULD** provide some details about components (dependencies)

```json
{
  "status": "UP",
  "components": {
    "discoveryComposite": {
      "description": "",
      "status": "UP",
      "components": {
        "discoveryClient": {
          "description": "",
          "status": "UP"
        }
      }
    },
    "livenessState": {
      "status": "UP"
    },
    "readinessState": {
      "status": "UP"
    }
  },
  "groups": [
    "liveness",
    "readiness"
  ]
}

```

The path ```/health/liveness``` **SHOULD** provide the liveness

```json
{
  "status": "UP"
}

```

The path ```/health/readiness``` **SHOULD** provide the readiness

```json
{
  "status": "UP"
}

```

Furthermore, continous integration tools **COULD** use the healthcheck endpoint to confirm that the API is running correctly.

### Information

An API **SHOULD** expose an endpoint to provide its information

The path ```/info``` **SHOULD** provide following information

```json
{
  "product": "vaapi-mails",
  "serviceStartTime": "2025-01-27T10:23:40Z",
  "buildTime": "2025-01-16T15:30:29Z",
  "serviceProcessId": 1,
  "version": "1.7.0-SNAPSHOT"
}

```

### Metrics

In non production environments, an API **SHOULD** expose an endpoint to give basic information about the metrics.

The path ```/metrics``` **SHOULD** provide following information (not exhaustive list)

```json
{
  "names": [
    "application.ready.time",
    "application.started.time",
    "disk.free",
    "disk.total",
    "executor.active",
    "executor.completed",
    "executor.pool.core",
    "executor.pool.max",
    ...
  ]
}
```
