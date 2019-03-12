https://www.wanadev.fr/24-tuto-docker-demarrer-docker-partie-2/

# Evolution du développement logiciel

|                         |        Passé         |       Présent / Futur       |
| :---------------------- | :------------------: | :-------------------------: |
| Type d'application      |     Monolithique     |       Micro-Services        |
| Cycles de développement |        Longs         |           Courts            |
| Environnement           |       Un seul        |          Plusieurs          |
| Mises en Production     |        Rares         |         Fréquentes          |
| Scaling                 |       Vertical       |         Horizontal          |
| Outils                  | 1 language / 1 stack | Plusieurs langages / stacks |

# Scaling Vertical et Horizontal

## Vertical
Scaling up veut dire qu'on va ajouter des ressources matérielles à la machine par exemple CPU, Memory, Disques etc.
Mais cette technique à une limite, la limite matérielle

## Horizontal
Si on a besoin de plus de puissance on va ajouter un autre noeud, ça permet une correlation entre le nombre de noeuds et la performance (traitement de plus de données dans une même mesure de temps).
Le scaling Horizontal requiert des programmes qui peuvent s'exécuter sur des systèmes distribués.

# Evolution de l'infrastructure

Normal:
App App App
Bins/libs
Host OS
Server

Virtual:
**App
Bins/Libs
Guest OS**< VM>
Hypervisor
Host OS
Server

Containerized:
**App
Bins/Libs** <Container
Container Engine
Host OS
Server

Container engine va permettre de faire tourner en // des conteneurs:
On a plus besoin d'avoir l'OS, les libs (tout ce qui faisait que les VMs étaient grosses à gérer et mettaient du temps à démarrer)
On va pouvoir gérer ça plus simplement en s'appuyant sur l'OS qui est en dessous:
faire tourner sur le kernel de l'os qui est en dessous, nos conteneurs 

# Qu'est ce qu'un container
Enveloppe permettant de packager une application avec juste ce dont elle a besoin pour fonctionner,
Peut contenir n'importe quoi à condition que ça puisse fonctionne sur linux kernel
Peut être déployé tel quel partout
Utilise le kernel du serveur hôte,
Possède son propre espace de processus et sa propre interface réseau
Isolé de l'hôte mais exécuté directement dessus
Permet de décomposer l'infrastructure applicative en petits éléments.

# Pourquoi utiliser des containers ?
Meilleurs performances que VMs
Portabilité d'un environnement à l'autre (multi-cloud)
Cohérence entre chaque environement: Dev, Test et Prod,
Modularité simplifiée: une application peut être composée de plusieurs containers
Gestion facilitée de l'héritage technique grâce à l'isolation

Utiliser une ancienne application avec des anciennes librairies avec des applications plus récentes sur le même serveur.

Les containers ne sont pas nouveau:
 - chroot
 - Solaris Containers et Zones: 2004
 - LXC - Linux Containers : 2008
Mais ces solutions sont très compliquées à mettre en oeuvre sous Linux.
cgroups: services du Linux Kernel qui permettent de limiter et prioriser les ressources,
namespaces: permettent d'isoler les ressources.

Docker a permis de simplfier ces concepts pour les utilisateurs.

# Docker : Histoire
dotCloud: un PaaS avec un Container engine custom écrit en Python
Au départ société française, maintenant basée à San Francisco,
Fin 2012: réécriture en Go,
2013: première release publique Open Source de Docker,
Réactions très positives,
dotCloud change de nom pour Docker,
Sept 2014 levée de fonds de 40 millions de $
Avril 2015: levée de fonds de 95 millions de $

# Points 

Dockerfile: contient une liste d'instruction pour construire un container de manière répétable,
Docker Hub: bibliothèque d'images publiques ou privées pouvant être réutilisées directement
Utilisation d'un Union File System : stocker par dessus l'image du FS juste les deltas (changements) les uns par dessus les autres.


Ecosystème applicatif en construction: Compose, Swarm, Universal Control Plane, Trusted Registry,
Très grosse communauté.

exemples d'utilisation
Exemple de run de container
Exemple de docker file


# et ?

Docker permet de facilement créer, déployer et exécuter des containers, 
Mais ...
Au départ, utilisé surtout sur la machine locale puis peu à peu jusqu'en production,

Donc:
- Comment gérer et planifier efficacement le cycle de vie des containers ?
- Comment monter en charge ?
- Comment manager de grosses quantitées de containers ?

==> Orchestration

Docker Swarm, Apache Mesos, Kubernetes



# Le conteneur
Un conteneur :
* [Agnostique](https://fr.wiktionary.org/wiki/agnostique) sur le contenu et le transporteur,


