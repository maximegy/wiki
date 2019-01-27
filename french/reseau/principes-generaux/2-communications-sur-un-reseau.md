<!-- TITLE: Communications sur un réseau -->
<!-- SUBTITLE: Notions de base et vocabulaire -->

# Les éléments de communication
## Les éléments principaux de communication
Une communication commence avec l'envoi d'un message (des informations) d'un individu ou un périphérique à un autre.
On échange par de nombreuses méthodes de communication différentes mais elles ont toutes en commun:
- Une <span style="color:red">source</span> du message, l'expéditeur.
  > Les sources d'un message sont les personnes ou les périphériques électroniques qui doivent envoyer un message à d'autres individus ou périphériques.
- Une <span style="color:red">destination</span>, le destinataire.
  > La destination reçoit le message et l'interprète.
- Un <span style="color:red">canal</span>.
  > Il est constitué du support qui fournit la voie par laquelle le message peut se déplacer depuis la source vers la destination.

> Imaginons que nous souhaitons communiquer par des mots, des images et des sons. Chacun de ces messages peut-être envoyé à travers un réseau en étant au préalable converti en chiffres binaires, ou <span style="color:red">bits</span>. Ces bits sont ensuites codés pour former un signal qui peut être transmis via le support approprié. Dans un réseau informatique, le support est généralement un type de transmission par câble ou sans fil.

## Communication des messages
En théorie, une communication unique, comme une vidéo ou un mail, pourraient être transmis à travers un réseau depuis une source vers une destination sous la forme d'un flux continu et volumineux de bits.
Si des messages étaient réellement transmis de cette manière, alors aucun autre périphérique ne serait en mesure d'envoyer ou de recevoir des messages sur ce même réseau pendant le transfert de ces données. Ces flux de données volumineux entraîneraient des retards conséquents.

Il existe donc une meilleure approche qui consiste à diviser les données en parties de tailles moins importante et plus facilement gérables pour les envoyer sur le réseau. Cette division du flux de données en parties plus petites est appelée <span style="color:red">segmentation</span>. Cette dernière présente deux avantages:
1. Par l'envoi de parties individuelles de plus petite taille depuis une source vers une destination, de nombreuses conversations différentes peuvent s'entremêler sur le réseau. Le processus qui sert à entremêler les parties des différentes conversations entre elles sur le réseau est appelé <span style="color:red">multiplexage</span>.
2. La segmentation peut augmenter la fiabilité des communications réseau. Les différentes parties de chaque message n'ont pas besoin de parcourir le même chemin sur le réseau depuis la source jusqu'à la destination. Si un chemin particulier devient encombré en raison du trafic de données ou qu'il connaît une défaillance, les parties individuelles du message peuvent toujours être adressées à la destination via d'autres chemins. Si une partie du message ne parvient pas à sa destination, seules les parties manquantes seront transmises à nouveau.

L'inconvénient que présente l'utilisation de la segmentation et du multiplexage pour la transmission des messages à travers un résau réside dans le niveau de complexité ajouté au processus.
> Imaginons que nous devions une lettre de 100 pages mais que chaque enveloppe ne peut contenir qu'une seule page. Le processus d'écrire de l'adresse, de mise sous enveloppe, d'envoi, de réception et d'ouverture de la totalité des 100 enveloppes prendrait beaucoup de temps à l'expéditeur et au destinataire.

## Composants du réseau
Le chemin emprunté par un message depuis une source vers une destination peut être aussi simple sue le connexion entre deux ordinateurs ou aussi complexe qu'un réseau parcourant de globe terrestre.
Cette <span style="color:red">infrastructure réseau</span> constitue la <span style="color:red">plateforme réseau</span>. Elle fournit le canal stable et fiable à travers lequel nos communications peuvent s'établir.

Les <span style="color:red">périphériques</span> et les <span style="color:red">supports</span> représentent les éléments physiques ou le matériel du réseau. Le matériel correspond souvent aux composants visibles de la plateforme réseau, tel qu'un ordinateur portable, un ordinateur de bureau, un commutateur ou le câblage qui sert à relier les périphériques. Parfois, certains composants ne sont pas visibles. Dans le cas d'un support sans fil, les messages sont transmis à travers l'aur, à l'aide d'une fréquence radio ou d'ondes infrarouges invisibles.

Les <span style="color:red">services</span> et les <span style="color:red">processus</span> constituent les programmes de communication, appelés logiciels, qui sont exécutés sur les périphériques réseau.
* Un service réseau fournit des informations en réponse à une demande. Les services incluent de nombreuses applications réseau courantes et les services d'hébergement Web.
* Les processus fournissent les fonctionnalités qui dirigent et déplacent les messages à travers le réseau. Les processus nous semblent moins évidents, mais ils sont essentiels au fonctionnement des réseaux.

## Périphériques finaux et leur rôle sur le réseau
Les péripériques réseau auxquels les personnes sont le plus habituées sont appelés <span style="color:red">périphériques finaux</span>. Ces périphériques forment l'interface entre le réseau humain et le réseau de communication sous-jacent. Certains de ces périphériques finaux sont les suivants:
* Ordinateurs (stations de travail, portables, serveurs, ...),
* Imprimantes réseaux,
* Téléphones IP,
* Caméras de surveillance,
* Périphériques portables mobiles (lecteurs de code barres, smartphone, ...),
* ...

Dans le cas d'un réseau, les périphériques finaux sont appelés <span style="color:red">hôtes</span>. Un hôte constitue soit la source, soit la destination d'un message transmis à travers le réseau. Pour qu'il soit possible de faire une distinction entre les hôtes, chaque hôte sur un réseau est identifié par une <span style="color:red">adresse</span>. Lorsqu'un hôte démarre une communication, il utilise l'adresse de l'hôte de destination pour indiquer où le message doit être envoyé.

Dans les réseaux actuels, un hôte peut jouer le rôle de <span style="color:red">client</span>, de <span style="color:red">serveur</span> ou les deux. Le logiciel installé sur l'hôte détermine son rôle sur le réseau:
* Les <span style="color:red">serveurs</span> sont des hôtes équipés de logiciels leur permettant de fournir des informations et des services, commes les emails, des pages web, à d'autres hôtes sur le réseau.
* Les <span style="color:red">clients</span> sont des hôtes équipés d'un logiciel qui leur permet de demander des informations auprès du serveur et de les traiter et/ou les afficher.

## Périphériques intermédiaires et leur rôle sur le réseau


## Supports réseau

