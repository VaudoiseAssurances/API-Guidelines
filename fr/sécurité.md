# Sécurité

Il y a deux types d'APIs : celles qui présentent des enjeux de sécurité, et celles qui n'en présentent pas.

Une API est considérée comme présentant des enjeux de sécurité si la réponse à au moins l'une des 3 questions ci-dessous est "oui" :
  1. _Visibilité_: L'API est-elle exposée à l'externe de la Vaudoise ?
  2. _Type de données_: L'API permet-elle l'accès à des données restreintes ou confidentielles selon la définition des niveaux de confidentialité de la Vaudoise ?
  3. _Accès à la donnée_: L'API permet-elle la création, la modification ou la suppression de données ?

Ces questions et leurs réponses *DOIVENT* figurer dans la documentation de chaque API (voir chapitre Documentation Générale). On *DOIT* également indiquer dans la documentation si l'API _présente des enjeux de sécurité_.

Si une API présente des enjeux de sécurité, alors les exigences suivantes *DOIVENT* être remplies.
 
  - Code scanning – intégration du code source à WhiteHat (seulement si l'API est exposée sur Internet - les _repositories_ git liés à l'API doivent être documentés et fournis à l'équipe sécurité)
  - Intégration dans l'API manager (obligatoire si API exposée sur Internet, recommandé sinon)
  - Droits gérés au niveau des méthodes et pas seulement de l'API et modèle d'accès documenté (fiche IAM) (couvert par l'API Manager)
  - Appel à l'API authentifié via jeton (couvert par l'API Manager)
  - Logging - les appels à l'API doivent être enregistrés et conservés pendant 90 jours (couvert par l'API Manager, mais vérifier gestion des logs et vérifier avec les logs du service)
  - Mise en place du contrôle périodique des droits (CPA) pour une revue régulière des accès donnés sur l'API aux end users dans l'API Manager

Si elles le sont, le tag « API secured » *DOIT* être mis à « oui » dans la page Wiki de documentation de l'API.
