<!-- TITLE: Communications sur un réseau -->
<!-- SUBTITLE: Notions de base et vocabulaire -->

# Les éléments de communication
## Les éléments principaux de communication
Une communication commence avec l'envoi d'un message (des informations) d'un individu ou un périphérique à un autre.
On échange par de nombreuses méthodes de communication différentes mais elles ont toutes en commun:
- Une [color=#FB0000]**source**[/color] du message, l'expéditeur.
  > Les sources d'un message sont les personnes ou les périphériques électroniques qui doivent envoyer un message à d'autres individus ou périphériques.
- Une [color=#FB0000]**destination**[/color], le destinataire.
  > La destination reçoit le message et l'interprète.
- Un [color=#FB0000]**canal**[/color].
  > Il est constitué du support qui fournit la voie par laquelle le message peut se déplacer depuis la source vers la destination.

> Imaginons que nous souhaitons communiquer par des mots, des images et des sons. Chacun de ces messages peut-être envoyé à travers un réseau en étant au préalable converti en chiffres binaires, ou <span style="color:red"> **bits** </span>. Ces bits sont ensuites codés pour former un signal qui peut être transmis via le support approprié. Dans un réseau informatique, le support est généralement un type de transmission par câble ou sans fil.

## Communication des messages
En théorie, une communication unique, comme une vidéo ou un mail, pourraient être transmis à travers un réseau depuis une source vers une destination sous la forme d'un flux continu et volumineux de bits.
Si des messages étaient réellement transmis de cette manière, alors aucun autre périphérique ne serait en mesure d'envoyer ou de recevoir des messages sur ce même réseau pendant le transfert de ces données. Ces flux de données volumineux entraîneraient des retards conséquents.

Il existe donc une meilleure approche qui consiste à diviser les données en parties de tailles moins importante et plus facilement gérables pour les envoyer sur le réseau. Cette division du flux de données en parties plus petites est appelée **[color=#FB0000]segmentation[/color]**. Cette dernière présente deux avantages:
1. Par l'envoi de parties individuelles de plus petite taille depuis une source vers une destination, de nombreuses conversations différentes peuvent s'entremêler sur le réseau. Le processus qui sert à entremêler les parties des différentes conversations entre elles sur le réseau est appelé **[color=#FB0000]multiplexage[/color]**.
2. La segmentation peut augmenter la fiabilité des communications réseau. Les différentes parties de chaque message n'ont pas besoin de parcourir le même chemin sur le réseau depuis la source jusqu'à la destination. Si un chemin particulier devient encombré en raison du trafic de données ou qu'il connaît une défaillance, les parties individuelles du message peuvent toujours être adressées à la destination via d'autres chemins. Si une partie du message ne parvient pas à sa destination, seules les parties manquantes seront transmises à nouveau.

L'inconvénient que présente l'utilisation de la segmentation et du multiplexage pour la transmission des messages à travers un résau réside dans le niveau de complexité ajouté au processus.
> Imaginons que nous devions une lettre de 100 pages mais que chaque enveloppe ne peut contenir qu'une seule page. Le processus d'écrire de l'adresse, de mise sous enveloppe, d'envoi, de réception et d'ouverture de la totalité des 100 enveloppes prendrait beaucoup de temps à l'expéditeur et au destinataire.

## Composants du réseau
Le chemin emprunté par un message depuis une source vers une destination peut être aussi simple sue le connexion entre deux ordinateurs ou aussi complexe qu'un réseau parcourant de globe terrestre.
Cette **[color=#FB0000]infrastructure réseau[/color]** constitue la [color=#FB0000]plateforme réseau[/color].

## Périphériques finaux et leur rôle sur le réseau


## Périphériques intermédiaires et leur rôle sur le réseau


## Supports réseau

