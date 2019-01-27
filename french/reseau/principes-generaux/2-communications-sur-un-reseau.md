<!-- TITLE: Communications sur un réseau -->
<!-- SUBTITLE: Notions de base et vocabulaire -->

# Eléments de communication
## Principaux éléments de communication
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

## Périphériques finaux
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

## Périphériques intermédiaires
En plus des périphériques finaux, les réseaux dépendent de <span style="color:red">périphériques intermédiaires</span> pour fournir une connectivité et travailler en arrière-plan, afin de garantir le flux des données à travers le réseau. Ces périphériques connectent les hôtes individuels au réseau et peuvent connecter plusieurs réseaux individuels afin de former un <span style="color:red">interréseau</span>. Ces périphériques réseau intermédiaires peuvent être:
* Périphériques d'accès réseau (concentrateurs, commutateurs et point d'accès sans fil),
* Périphériques interréseaux (routeurs),
* Serveurs et modems de communication,
* Périphérique de sécurité.

La gestion des données lors de leur passage à travers le réseau constitue également l'un des rôles des périphériques intermédiaires. Ces périphériques utilisent l'adresse d'hôte de destination, avec les informations concernant les interconnexions réseau, de manière à déterminer le chemin que doivent emprunter les messages à travers le réseau.
Les processus qui s'exécutent sur les périphériques du réseau intermédiaire remplissent les fonctions suivantes:
- régénérer et retransmettre des signaux de données,
- gérer des informations indiquant les chemins qui existent à travers le réseau et l'interréseau,
- indiquer aux autres périphériques les erreurs et les échecs de communication,
- diriger des données vers d'autres chemins en cas d'échec de liaison,
- classifier et diriger des messages en fonction des priorités QoS,
- autoriser ou refuser le flux de données, selon des paramètres de sécurité.

## Supports réseau
La communication à travers un réseau s'effectue sur un support. Ce support fournit le canal via lequel le message se déplace de la source à la destination.

Les réseaux modernes utilisent principalement trois types de supports pour interconnecter des périphériques et fournir le chemin par lequel des données peuvent être transmises. Ces supports sont les suivants:
* Fils métailliques dans des câbles,
* Câbles en fibres optiques (Fibres de verre ou optiques de plastiques),
* Transmission sans fil.

Le codage du signal qui doit se produire afin de transmettre le message diffère selon le type de support. Sur des <span style="color:red">fils métalliques</span>, les données sont coddées en <span style="color:red">impulsions électriques</span> qui correspondent à des modèles spécifiques. Les transmissions par <span style="color:red">fibre optique</span> s'effectuent via des <span style="color:red">impulsion de lumière</span>, dans des plages de lumières infrarouges ou visibles. Dans les <span style="color:red">transmissions sans fil</span>, des modèles d'<span style="color:red">ondes electromagnétiques</span> illustrent les différentes valeurs de bit.

Les différents types de supports réseau possèdent divers avantages et fonctionnalités. Tous les supports rréeau ne possèdent pas les mêmes caractéristiques et ne conviennent pas pour les mêmes objectifs.
Les critères de choix d'un support réseau sont:
* La distance sur laquelle les supports peuvent transporter correctement un signal,
* L'environnement dans lequel les supports doivent être installés,
* La quantité de données et le débit de la transmission,
* Le coût des supports et de l'installation.

# Réseaux locaux, réseau métropolitain, réseaux étendus et interréseaux
Les infrastructures réseau peuvent considérablement varier selon:
- la taille de la zone couverte,
- le nombre d'utilisateurs connectés,
- le nombre et les types de services disponibles.
Le type de réseau local (local, métropolitain, étendu) dépendra donc de ces différents critères.

## Réseaux locaux
Un réseau individuel s'étend généralement sur une zone géographique unique et fournit des services et des applications aux personnes au sein d'une structure organisationnelle commune, telle qu'une entreprise, un campus, une région ou une maison.
Ce tpe de réseau est appelé <span style="color:red">réseau local</span>: 
<center>
**LAN** : <span style="color:red">L</span>ocal <span style="color:red">A</span>rea <span style="color:red">N</span>etwork
**RLE** : <span style="color:red">R</span>éseau <span style="color:red">L</span>ocal d'<span style="color:red">E</span>ntreprise
</center>
En règle général, un réseau local est <span style="color:red">*administré par une organisation unique*</span>. Le contrôle administratif qui gère les stratégies de sécurité et de contrôle d'accès s'applique au niveau du réseau.

## Réseaux métropolitains
Certaines organisations (un campus, une ville) doivent gérer des sites distants les uns des autres de quelques kilomètres. Ces différents sites regroupent un ensemble d'ordinateurs et fournissent deifférents services.
Ce type de réseau est appelé <span style="color:red">réseau métropolitain</span>:
<center>**MAN** : <span style="color:red">M</span>etropolitan <span style="color:red">A</span>rea <span style="color:red">N</span>etwork</center>

Ces réseaux utilisent généralement des fibres optiques pour relier les différents sites. Certaines technologies  utilisées dans ce but sont l'ATM ou le FDDI. Ces anciennes technollogies sont en passe d'être remplacées par le Gigabit Ethernet utilisé dans de nombreux MAN, comme dans les LAN.
Comme pour les réseaux locaux, les réseaux métropolitains sont <span style="color:red">*administrés par une organisation unique*</span>.