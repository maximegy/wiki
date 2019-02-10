<!-- TITLE: Modèle OSI et TCP/IP -->
<!-- SUBTITLE: A quick summary of Systemes De Numeration -->

# Besoins et utilisation d'un modèle par couche
Précédemment, nous avons parlé de **protocoles** et **suites de protocoles**. Dans ces suites, ou piles, chaque protocole à un rôle précis. Le résultat produit par un protocole sert ensuite à un autre protocole et ainsi de suite.
Pour visualiser l'interaction entre ces différents protocoles, un modèle en **couches** est généralement utilisé. Un modèle en couches illustre le fonctionnement des protocoles dans chaque couche, ainsi que l'<span style="color:green">interaction avec les couches supérieures et inférieures</span>.

> **Pourquoi un modèle réseau en couches ?**
> Un modèle de réseau en couche peut servir à visualiser comment les paquets de données circulent à partir des programmes d'application (documents, messagerie, chat, etc.), en passant par un média réseau (câble, Wifi, etc.) jusqu'à un autre programme d'application se trouvant sur un autre ordinateur en réseau.

L'utilisation d'un modèle en couches présente certains avantages pour décrire des protocoles et des opérations sur un réseau. L'utilisation d'un modèle en couches:
* Aide à la conception d'un protocole. Un protocole fonctionnant à une couche spécifique doit disposer d'informations clairement définies et il doit également tenir compte des couches supérieures et inférieures,
* Il encourage la concurrence, car les produits de différents fournisseurs peuvent fonctionner ensemble,
* Il permet d'éviter que des changements technologiques ou fonctionnels dans une couche ne se répercutent sur d'autres couches, supérieures ou inférieures,
* Fournit un langage commun pour décrire des fonctions et des fonctionnalités réseau.

# Modèle de protocole et modèle de référence
Il existe deux types de modèles de réseau de base :les modèles de protocole et les modèles de référence.

Un modèle de protocole fournit un modèle qui correspond étroitement à la structure d'une suite de protocoles particulière et existante. L'ensemble hiérarchique des protocoles associés dans une suite représente généralement toutes les fonctionnalités requises à l'interface entre le réseau humain et le réseau de données.

Le **modèle TCP/IP** est un *modèle de protocole*, car il décrit les fonctions qui interviennent à chaque couche de protocoles au sein de la suite TCP/IP.

Un modèle de référence fournit une référence commune pour maintenir la cohérence dans tous les types de protocoles et de services réseau. Un modèle de référence n'est pas destiné à être une spécificationd'implémentation, ni à fournir un niveau de détail suffisant pour définir précisément les services de l'architecture réseau. Le principal objectif d'un modèle de référence est d'assurer une compréhension plus claire des fonctions et des processus impliqués.

Le **modèle OSI** (Open System Interconnection) constitue le *modèle de référence* interréseau le plus connu. Il est utilisé pour la conception de réseaux de données, des spécifications d'opérations et la résolution de problèmes.

Bien que les modèles TCP/IP et OSI soient les principaux modèles utlisés lorsqu'il s'agit de fonctionnalités réseau, les concepteurs de protocoles, de services ou de périphériques réseau peuvent créer leurs propres modèlespour représenter leurs produits. Enfin, les concepteurs doivent communiquer avec l'industrie en associant leurs produits ou leurs services aux modèles OSI ou TCP/IP ou aux deux.

# Le modèle de protocole TCP/IP
Le premier modèle de protocole en couches pour les communications interréseau fut créé au début des <span style="color:red">années 70</span> et est appelé modèle Internet. Il définit 4 catégories de fonctions qui doivent s'exécuter pour que les communications réussissent. L'architecture et la suite de protocoles TCP/IP suit la structure de ce modèle. Pour cette raison, le modèle Internet est généralement appelé "**modèle TCP/IP**".

La plupart des modèles de protocole décrivent une pile de protocoles spécifiques au fournisseur. Cependant, puisque le modèle TCP/IP est une **norme ouverte**, aucune entreprise ne contrôle la définition du modèle. Les définitions de la norme et des protocoles TCP/IP sont traités dans un forum public et définies dans un ensemble de documents disponibles au public. Ces documents sont appelés **documents RFC** (Request For Comments). Ils contiennent les spécifications formelles des protocoles ainsi que des ressources ui décrivent l'utilisation des protocoles.

|  N°   |    Couche    | Description                                                                                                                                                       |
| :---: | :----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|   4   | Application  | La couche 4 regroupe tous les aspects liés aux applications. Les question de représentation et de codage des données, le contrôle du dialogue avec l'utilisateur. |
|   3   |  Transport   | La couche 3 prend en charge la communication entre différents périphériques à travers divers réseaux.                                                             |
|   2   |   Internet   | La couche 2 Détermine le meilleur chemin que les données doivent emprunter sur les divers réseaux.                                                                |
|   1   | Accès réseau | La couche 1 contrôle les périphériques matériels (carte réseau) et les supports (câble, fibre optique, etc.) qui constituent le réseau.                           |