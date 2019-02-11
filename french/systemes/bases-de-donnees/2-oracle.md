<!-- TITLE: Bases de données - Oracle -->
<!-- SUBTITLE: A quick summary of Introduction -->

# Histoire MDR
Histoire Oracle

Lawrence Ellison, comparé à Iron Man, il a financé le film, c'est un fou furieux, il fait de la voile, du F1, il apparait dans le film.

# Tarifs
Deux modes de licences:
Soit pour utilisateurs nommés, soit pour processeurs
différence entre nommés ou simultannés: 10 licences simultannés > 10 personnnes en meme temps, nommés: 200 utilisateurs, 200 licences.
a partir  du 51e user c'est mieux de prendre licence processeur.

1. Licence en mode "Named User Plus"

| Edition oracle       | Prix public licence/user | Prix maintenance Oracle /user/an | Nb mini licences |
| :------------------- | :----------------------: | :------------------------------: | :--------------: |
| Standard Edition Two |          304 €           |             66,85 €              |        10        |
| entreprise           |          825 €           |             181,45 €             |        25        |

1. Licence en mode "Processor Licence"

| Edition oracle       | Prix public licence/proc | Prix maintenance Oracle /proc/an | Nb maxi proc |
| :------------------- | :----------------------: | :------------------------------: | :----------: |
| Standard Edition Two |         15 194 €         |            3 342,57 €            |      2       |
| Enterprise           |         41 240 €         |            9 072,69 €            |   illimité   |

1. Personal Edition
Version pour les devs ou pour réaliser des tests sur une app. Prix à partir de 80€ pour une année, 280€ pour 5 ans et 399€ en licence perpétuelle.

4. Express Edition
Version totalement gratuite, il s'agit d'une version 11g, fortement limitée, elle gère actuellement des fichiers de données limitées à 11Go de données et un serveur doté d'un seul processeur et d'un maximum de 1 Go de mémoire RAM.


# Introduction
Un serveur Oracle DB est composé de deux éléments distincts
- L'instance, qui se compose d'une structure de mémoire partagée et d'un ensemble de processus,
- La BSS, qui se compose d'un ensemble de fchiers physique qui contiennent notamment les données.

Dans une architecture client/serveur, il y a également des processus utilisateurs correspondant à 

Principaux process:
- SGA , mémoire occupée sur le serveur,
- Listener, écoute les connexions

## L'instance
Une instance est composée:
- D'une zone de mémoire partagée appelée SGA System Global Area,
- D'un ensemble de processus d'arrière plan ayant chacun unrôle bien précis

### La SGA
- mémoire:
  - la library cache, qui stocke toutes les informations SQL qu'on a tapé, donc la donnée de la requête est mise en cache,
  - Le dictionnary Cache, des tables par oracle pour oracle pour son fonctionnement interne. (exemple la liste d'utilisateurs...).

#### La zone mémoire: Library Cache
La library Cache est une zone mémoire qui va stocker les informations sur les ordres SQL exécutés récemment dans une zone SQL Cache qui contiendra le texte de l'ordre SQL, la version compilée de l'ordre SQL et son plan d'execution
Cette zone mémoire sera utilisée lorsqu'une requête sera exécutée plusieurs fois, car Oracle n'aura plus alors à recréer la version compilée de la requête ainsi que son plan d'exécution (chemin).

## Les processus d'arrière plan:
### SMON
Le processus SMON est un processus qui va servir à corriger les plantages de l'instance et à vérifier la synchronisation des données.
Si l'instance plante, c'est SMON qui va se charger de rejouer le contenu des REDO LOG FILE afin de pouvoir rejouer les transactions et de resynchroniser els données dans les fichiers de données.
SMON sert aussi à nettoyer les segments temporaires après leur utilisation. Il sert aussi à défragmenter les fichiers de données, tablespaces et autres

### PMON
Le processus PMON (process monitor) va être surtout dédié aux processus des utilisateurs. Il va servir à annuler les transactions d'une sessions (lors d'un plantage de la sessions par exemple), mais aussi servir à relâcher tous les verrous posés par la session, et à relâcher toutes les ressources détenues par la session.

### DBWin
Le processus DBWn va être dédié à l'écriture du Database buffer cache dans les fichiers de données de la base de données.
Ce processus est aussi là pour vérifier en permanence le nombre de blocs libres dans le Database Buffer Cahe afin de laisser assez de place disponible pour l'écriture des données dans le buffer.

### LGWR
Le processus LGWR -Log Writer) est le processus qui va écrire les informations contenues dans le REDO LOG Buffer dans les fichiers REDOLOG File lors des évenements suivants:
- Quand une transaction est terminée avec un COMMIT,
- Quand le REDO LOG Buffer est au 1/3 plein
- Quand il n'y a plus de 1Mo d'informations de log contenues dans le Buffer,
- aadzzad

### CKPT
Ce processus va servir à mettre à jour les en-têtes des fichiers de données, et à mettre à jour les fichiers CONTROL FILE afin de spécifier que l'action de CHECKPOINT s'est bien déroulée.
Le cHECKPOINT est un évènement qui se déclanche lors:
- D'un changement de groupe de REDO LOG FILE,
- D'un arrêt nrmal de la BDDD?
- aaaa
- Dune limite définir par les paramètre d'initialisation

### ARCn

blabla




## Processus Serveur
Processus d'écoute par défaut port: 1521.
une fois connecté ne passe plus par le listener
### Processus d'écoute


### PGA
Mémoire avec données propres à l'utilisateur.


### 


## La base de données
Fichiers de donnés, c'est dans ces fichiers que les données proprement dites sont stockées,(tablespace.dbf)
Fichiers de contrôle, qui contient des informations de contrôle sur la BDDD (control.ctl)
Fichiers de journalisation, qui enregistrent toutes les modifications apportées à la base (redo.log)
archivelog, les fichiers de journalisation qui sont archivés, qui permet d'avoir les états des BDD à un temps donné
attention gourmand en espace disque.


### Fichiers de données
Tablespace

### Fichiers de contrôle


###Fichiers de journalisation

