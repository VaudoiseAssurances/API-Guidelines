# Exploitation

Cette section couvre les standards liés à l'exploitation.

## Environnements

Une API déployée en production **DOIT** systématiquement être déployé en amont sur un environnement de qualité assurance (autrement nommé UAT).

S'il est nécessaire d'avoir d'autres environnements, un développeur d'API **DEVRAIT** se baser sur les DNS Names Convention (Internal Link) existantes.

## Monitoring

### Monitor l'utilisation de l'API

L'équipe en charge d'une API utilisée en production **DEVRAIT** s'assurer qu'elle est monitorée.

### Health check

Une API **DEVRAIT** fournir un endpoint de health check sous la forme de

```json
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

De plus, la chaîne d'intégration continue **POURRAIT** l'utiliser afin de s'assurer que le déploiement s'est bien déroulé.

### Informations

Dans les environnements non production, une API **DEVRAIT** fournir un endpoint exposant les informations de dépendance à ses librairies Vaudoise.

```json
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

### Metriques

Dans les environnements non production, une API **DEVRAIT** fournir un endpoint exposant les unformations systeme basiques du serveur l'hébergeant.

```json
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