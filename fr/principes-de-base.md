# Principes de base

Cette section couvre les principes de base.

## API First

### Designer l'API avant de commencer l'implémentation technique

La signature de l'API **DOIT** être établie avant de commencer l'implémentation (OpenAPI specification, Stub, etc).

L'objectif d'une telle démarche est de permettre des retours le plus rapidement possible et d'avoir une discipline interne qui se concentre sur:

* la connaissance du domaine exposé ainsi que les fonctionnalités requises
* des entités / ressources business généralisées, i.e., éviter d'avoir des APIs pour des use-case spécifiques
* une réelle séparation entre le QUOI et le COMMENT

**La description de l'API est l'unique vérité, et non pas l'implémentation technique de l'API**. Si l'outil pour décrire l'API ne supporte pas nativement la description correcte de l'API, il est toujours possible d'écrire une documentation à la main.

L'implémentation d'une API **DOIT** toujours être conforme avec la description de l'API : cela représente le contrat entre l'API et ses consommateurs.

## Compatibilité

### Ne pas casser la rétrocompatibilité

Les changements d'APIs dans une même version majeur **NE DOIVENT PAS** casser la rétrocompatibilité. Les APIs sont un contrat entre le fournisseur de service et les consommateurs qui ne peut pas être cassé par des décisions unilatérales.

Il y a deux possibilités pour changer une API sans la casser:

* suivre les règles des extensions compatibles
* introduire une nouvelle version d'API tout en supportant les anciennes versions.

### Règles pour faire évoluer une API

Chaque modification mineure d'une API DOIT suivre les règles d'extension:

* **NE DOIT PAS** retirer de champs/propriétés,
* **NE DOIT PAS** rendre requis des champs optionnels,
* **NE DOIT PAS** supprimer un endpoint existant,
* Tout ce qui est rajouté **DOIT** être optionnel.

Si l'une des règles ci-dessus ne peut être respectée pour une quelconque raison, un développeur d'API **DOIT** publier une nouvelle version majeure.

## Documentation

### Documentation générale

Une API **DOIT** faire l'objet d'une documentation sous forme d'une page dans notre Wiki d'entreprise contenant au moins:

* Un descriptif
* L'équipe responsable clairement identifiée
* Lien vers les documentations Swagger

Cette page wiki **DOIT** être ajoutée à l'annuaire.

_Nota Bene : La communauté de l'API est tout à fait consciente que cette solution est temporaire. A terme, nous nous attendons à avoir un service registry centralisé, probablement dans un outil d'API Management._

### Documentation swagger

Une API **DOIT** exposer une documentation explicite, complète et à jour de ses endpoints et **DEVRAIT** l'exposer sous forme d'un Swagger.

## REST

### Ressources au lieu de verbe

Les APIs **DOIVENT** être designées autour des ressources, et **NE DOIVENT PAS** représenter des actions. Une API **PEUT** inclure les contrôles hypermedia (HATEOAS).

#### Niveau de maturité

Idéalement, nous visons le niveau 2 du modèle de maturité de Richardson, mais il est tout à fait possible d'utiliser le niveau 3 ([Plus d'informations](https://martinfowler.com/articles/richardsonMaturityModel.html)).

REST est centralisé autour des entités/ressources et l'utilisation des méthodes HTTP standards (tq. GET/POST/PUT/DELETE) en tant qu'opérations. Les URLs ne doivent contenir que des noms, et non pas des verbes.

Par exemple, au lieu d'avoir le verbe annuler dans l'URL, il faut plutôt penser à la ressource annulation.

### Utilisation des verbes

Les méthodes Http standard ont une signification, elles sont à utiliser pour déterminer le type d'action à effectuer.

Bien que ces méthodes ne soient pas équivalentes à du CRUD, il est préférable dans notre cas de les utiliser comme tel à des fins de simplification et de ne garder que des créations non idempotentes.

| Méthode   | Action    | Définition |          |
|-----------|-----------|------------|----------|
| POST      | Non-idempotent | Créer une resource | C |
| GET      | Nullipotent (Safe) | Retourner une/des resource(s) | R |
| PUT      | Idempotent | Modifier une ressource | U |
| DELETE      | Idempotent | Supprimer une resource | D |

#### POST

* Un POST (create, dans notre cas) exécuté avec succès retourne un 201. Le header doit contenir un header `Location` donnant le lien vers la nouvelle entité.
* Dans le cas d'une opération asynchrone, la réponse doit être un 202 contenant un header `Location` permettant de monitorer l'état de l'opération.

#### GET

* Un GET retournant une ressource exécutée avec succès retourne un 200.
* Un GET retournant plusieurs ressources avec succès retourne un 200 si toutes les ressource sont présentes ou un 206 si une partie des ressources est retournée (paging, top n). Dans ce cas-là, la réponse doit contenir un header `Content-Range`.

#### PUT

* Un PUT (update, dans notre cas) exécutée avec succès retourne un 200 ou un 204.
* Dans le cas d'une opération asynchrone, la réponse doit être un 202 contenant un header `Location` permettant de monitorer l'état de l'opération.

#### DELETE

* Un DELETE exécuté avec succès retourne un 200 ou un 204.
* Dans le cas d'une opération asynchrone, la réponse doit être un 202 contenant un header `Location` permettant de monitorer l'état de l'opération.
