Chaque équipe est responsable du respect de ces standards pendant les développements d'API et chaque membre est encouragé à faire évoluer ces guidelines de manière collaborative, avec les membres de la communauté de pratique API.

Dans le cas d'une évolution de ces standards API, il faut suivre les règles suivantes:

* les API existantes ne doivent pas être systématiquement changées, bien que cela soit conseillé,
* les nouvelles API doivent respecter la version courante des standards.

Ce présent document utilise les termes **DOIT**, **DEVRAIT**, **PEUT** comme mots-clés pour définir le niveaux d'exigence d'une spécification telle que définit dans la RFC 2119 (version française).


| Terme | Définition |
|-------|------------|
|**DOIT**| Ce mot, ou les termes "**OBLIGATOIRE**" ou "**DEVRA**", veut dire que la définition est une exigence absolue de la spécification. |
|**NE DOIT PAS** |	Cette phrase, ou la phrase "**NE DEVRA PAS**", veut dire que la définition est une interdiction absolue de la spécification. |
|**DEVRAIT** | Ce mot, ou l'adjectif "**RECOMMANDÉ**", veut dire qu'il peut exister des raisons valides dans des circonstances particulières pour ignorer un item particulier, mais les répercussions doivent être comprises et soigneusement évaluées avant de choisir un cours différent.|
|**NE DEVRAIT PAS** | Cette phrase, ou la phrase "**NON RECOMMANDÉE**" veut dire qu'il peut exister des raisons valides dans  des circonstances particulières quand le comportement spécifique est acceptable ou même utile, mais les répercussions complètent devraient être comprise et le cas soigneusement évalué avant d'implémenter tout comportement décrit avec cette étiquette.|
|**PEUT** |	Ce mot ou l'adjectif "**OPTIONNELLE**", signifie qu'un item est vraiment optionnel. Un vendeur peut choisir d'inclure l'item parce qu'une place de marché spécifique l'exige ou parce que le vendeur pressent que cela améliore le produit alors qu'un autre vendeur peut omettre le même item. Une implémentation qui n'inclut pas une option particulière **DOIT** être préparée à inter-opérer avec une autre implémentation qui n'inclut pas l'option, même peut-être avec une fonctionnalité réduite. Dans la même veine, une implémentation qui inclut vraiment une option particulière **DOIT** être préparée à inter-opérer avec une autre implémentation qui n'inclut pas l'option (exception faite, bien sûr, pour la fonctionnalité que l'option fournit.)|

# Principes de base

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

Chaque modification mineur d'une API DOIT suivre les règles d'extension:

* **NE DOIT PAS** retirer de champs/propriétés,
* **NE DOIT PAS** rendre requis des champs optionnels,
* **NE DOIT PAS** supprimer un endpoint existant,
* Tout ce qui est rajouté **DOIT** être optionnel.

Si l'une des règles ci-dessus ne peut être respectée pour une quelconque raison, un développeur d'API **DOIT** publier une nouvelle version majeure.

## Documentation

### Documentation générale

Une API **DOIT** faire l'objet d'une documentation sous forme de wiki contenant au moins:

* Un descriptif
* L'équipe responsable clairement identifiée
* Lien vers les documentations Swagger

Cette page wiki **DOIT** être ajoutée à l'annuaire.

_La communauté de l'API est tout à fait consciente que cette solution est temporaire. A terme, nous nous attendons à avoir un service registry centralisé, probablement dans un outil d'API Management._

### Documentation

Une API **DOIT** exposer une documentation explicite, complète et à jour de ses endpoints et **DEVRAIT** l'exposer sous forme d'un Swagger.


