<!-- TITLE: Bases de données - Introduction -->
<!-- SUBTITLE: A quick summary of Introduction -->

# Définition
BDD C'est un lot d'information stocké dans un dispositif informatique,
Les technologies existantes permettent d'organiser et de structurer la base de donnée

# Système de gestion de base de données
Le Système de Gestion de Bases de Données, 
C'est un logiciel qui sert à la manipulation de bases de données.
(SGBD ou DBMS en anglais.)
LA BDD est statique, il faut un système pour le gérer
Il sert à effectuer des opérations ordinaires telles que consulter, modifier, construire, organiser, transformer, copier, save ou restorer des bdd
La majorité des SGBB du marché manipule des bdd relationnelles.

# SGBD en entreprise
Une entreprise doit conserver un volume élevé d'informations
Ces informations se retrouvent dans différents systèmes de traitement:
ERP,
Systèmes gestion des stocks ...
La gestion peut etre complexe, c'est pour ça qu'une BDD et un SGBD interviennent.

Utilisateurs>
Concepteurs analystes>
                            Principaux acteurs
Développeurs>
Administrateurs DBA>

# Base de données relationnelle
Dans une Base de données relationnelle les données sont stockéss dans des tableaux à deux dimensions appelés **tables**.
La manipulation de ces données se fait selon la théorie mathématique des relations (créé par Edgar Frank Codd en 1970).
Le modèle relationnel est une manière de modéliser les relations existantes entre plusieurs informations et les ordonner entre elles.
Selon le modèle relationnel, il peut y avoir plusieurs relations connectées implicitement par les valeurs qu'elles contiennent. Dans une BBDR, chaque enregistrement d'une table contient un groupe d'informations relatives à un sujet et les différents sujets sont connexes. Les liens existants entre les informations sont stockés dans les champs des enregistrements sous forme de **clé primaire** et **clé étrangère**.
La majorité des SGBD actuels est basé sur le modèle relationnel (SGBDR).

# Principaux SGBDR
SQLite,
MySQL,
MariaDB,
Oracle,
## Access
Microsoft, commercial, BDD de petites tailles, Facilement gérable,
Suite Office

## SQL server
Microsoft, commercial, version "express" gratuite, installation dans un environnement Windows et Linux depuis version 2016, BDD moyenne et grosse.

## SQLite
Open source, BDD embarquée, simple, limité, firefox skype android...

## MySQL
Oracle(anciennement SUN), commercial pour le support, version "community" gratuite, très populaire, Web (LAMP)
O peut faire du cluster maintenant, plus des consoles d'administration.

## MariaDB
MariaDB Fondation, open source, Fork de MySQL (5.1), Red Hat remplace MySQL par MariaDB.

## POSTGRESQL
Communauté postgreSQL, Opensource, très bonne réputation et très performant.
Par là qu'il faut commencer, c'est le top du top.

## Oracle
Oracle database, étité par oracle coprotation, commercial, version "XE" gratuite (déconseillé car très jeune, buggé, faille de sécurité), performance +++, fonctionnalités +++, BDD Grosse et très grosse, prix très élevé.


# Architecture client / serveur
Le client est un ordinateur qui fournit une interface entre l'usager et l'application informatique
1. blablabla


envoi d'une requête au serveur, traitement, retour du résultat.

# Architecture 3 tier
Poste client > serveur Wab > Serveur BDD

# Définition: BDDR
C'est un stock d'informations décomposées et organisées dans des tableaux à deux dimensions appelés tables.

Qu'est ce qu'une table:
Elle a un nom,
Elle est composées de colonnes et de lignes.

# Présentation SQL
SQL: Structured Query Langage
Le SQL se subdivise en différents langages permettant soit la définition des éléments d'une base de données: 
- **manipulation des données**,
- la **gestion des droits d'accès** aux données et des transactions,
- l'**extraction des données**.
C'est un lagage de type déclaratif, c'est à dire que l'on spécifie les propriétés des données que l'on souhaite manipuler logiquement.

## SQL SELECT 
Afficher
## Insert
ajouter,
## Update
Modifier
## Delete
supprimer

# Intégrité et transaction
Plusieurs utilisateurs doivent pouvoir accéder aux données et les modifier sans qu'il en résulte de dégâts causés par des manipulations qui s'enchevêtrent. C'est ce que l'on appelle le respect de l'intégrité des données.
Les transactions sont la clef même de toute problématique d'accès concurrent.Une transaction est un ensemble cohérent faites sur les données
ROLLBACK > annulé
COMMIT > validé
Tant qu'il n'y a pas eu de commit.

# Les différents types de BDDR
- Transactionnelle (OLTP: Online Transaction Processing), elle se caractérise par une forte activité de mise à jour (insert/update), un nombre plus ou moins important d'utilisateurs, une exigence de temps de réponse court (support, ERP, ticket)
- Décisionnelle (DSS: Decision Support Systems) Elle se caractérise par une forte activité d'interrogation (SELECT) généralement sur de grosvolumes de données, une mise à jour périodique avec de gros traitements, une exigence de temps de réponse relativement court
- Mixt elle est à la fois transactionnelle et décisionnnelle, le pods respectif de chaque activité étant variable.

# Histoire MDR
Histoire Oracle