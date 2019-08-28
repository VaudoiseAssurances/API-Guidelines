Chaque équipe est responsable du respect de ces standards pendant les développements d'API et chaque membre est encouragé à faire évoluer ces guidelines de manière collaborative, avec les membres de la communauté de pratique API.

Dans le cas d'une évolution de ces standards API, il faut suivre les règles suivantes:

* les API existantes ne doivent pas être systématiquement changées, bien que cela soit conseillé,
* les nouvelles API doivent respecter la version courante des standards.

Ce présent document utilise les termes **DOIT**, **DEVRAIT**, **PEUT** comme mots-clés pour définir le niveaux d'exigence d'une spécification telle que définit dans la [RFC 2119](http://microformats.org/wiki/rfc-2119-fr) (version française).


| Terme | Définition |
|-------|------------|
|**DOIT**| Ce mot, ou les termes "**OBLIGATOIRE**" ou "**DEVRA**", veut dire que la définition est une exigence absolue de la spécification. |
|**NE DOIT PAS** |	Cette phrase, ou la phrase "**NE DEVRA PAS**", veut dire que la définition est une interdiction absolue de la spécification. |
|**DEVRAIT** | Ce mot, ou l'adjectif "**RECOMMANDÉ**", veut dire qu'il peut exister des raisons valides dans des circonstances particulières pour ignorer un item particulier, mais les répercussions doivent être comprises et soigneusement évaluées avant de choisir un cours différent.|
|**NE DEVRAIT PAS** | Cette phrase, ou la phrase "**NON RECOMMANDÉE**" veut dire qu'il peut exister des raisons valides dans  des circonstances particulières quand le comportement spécifique est acceptable ou même utile, mais les répercussions complètent devraient être comprise et le cas soigneusement évalué avant d'implémenter tout comportement décrit avec cette étiquette.|
|**PEUT** |	Ce mot ou l'adjectif "**OPTIONNELLE**", signifie qu'un item est vraiment optionnel. Un vendeur peut choisir d'inclure l'item parce qu'une place de marché spécifique l'exige ou parce que le vendeur pressent que cela améliore le produit alors qu'un autre vendeur peut omettre le même item. Une implémentation qui n'inclut pas une option particulière **DOIT** être préparée à inter-opérer avec une autre implémentation qui n'inclut pas l'option, même peut-être avec une fonctionnalité réduite. Dans la même veine, une implémentation qui inclut vraiment une option particulière **DOIT** être préparée à inter-opérer avec une autre implémentation qui n'inclut pas l'option (exception faite, bien sûr, pour la fonctionnalité que l'option fournit.)|

# Table des matières

* [Principes de base](principes-de-base.md)
  * [API First](principes-de-base.md#api-first)
  * [Compatibilité](principes-de-base.md#compatibilité)
  * [Documentation](principes-de-base.md#documentation)
  * [REST](principes-de-base.md#rest)
* [Message](message.md)
* [Requête](requête.md)
* [Nomenclature](nomenclature.md)
* [Protocole](protocole.md)
* [Exploitation](exploitation.md)
