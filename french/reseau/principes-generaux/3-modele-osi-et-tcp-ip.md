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