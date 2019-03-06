<!-- TITLE: No space left on device -->
<!-- SUBTITLE: Space problem when build containers -->

# Problème
Lorsqu'on utilise beaucoup docker for windows, il est possible qu'au bout d'un moment on ai comme erreur "no space left on device". Ce n'est pas un problème d'espace sur notre disque dur mais sur celui de la Machine Virtuelle Docker.
Par défaut, 20 GB sont alloués à la VM qui n'est pas suffisant. Aussi, la VM Docker, ne purge pas les fichiers temporaires et en cache, ce qui fait donc diminuer, build après build, l'espace disponible.

# Solution
Lorsque ceci se produit, il faut supprimer la machine.
Via l'interface CLI de Docker for Windows lancer la commande:
`docker-machine rm -f default`
default correspond à la machine "default" si vous avez créé une machine avec un autre nom, il convient donc de remplacer ce nom par le bon.

Ensuite il faut créer une nouvelle machine:
`docker-machine create -d virtualbox --virtualbox-disk-size "80000" default`
Cette commande va donc créer sur **virtualbox** une machine "**default**" avec un disque de **80 GB**

Il faut maintenant ajouter cette nouvelle machine à notre environnement de travail (Pour que le CLI soit attaché à cette VM).
`docker-machine env default`
et
`eval $(docker-machine env default)`