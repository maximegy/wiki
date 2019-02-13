<!-- TITLE: Supervision -->
<!-- SUBTITLE: A quick summary of Supervision -->

# Header

La supervision va porter sur 3 axes :
analyse des flux
éuquipements
services

On utilise principalement SNMP
station de supervision : exécute les applications
éléments actifs: équipements ou logiciels à gérer, chaque élément dispose d'un agent qui répond aux requêtes
MIB
protocole

station supervision > get set > agent SNMP
																< Trap réponse <
																
SNMP fonctionne au niveau 7 du modèle OSI
il s'appuie sur UDP et écoute les ports 161 pour l'agent, et 162 pour la station de supervision

Get: demande une information à l'agent
Getnext: demande l'information suivante a l'agent
Getbulk : demande pour connaitre la valeur de plusieurs valeurs
Set : commande envoyée par le manageur à l'agent pour définir la valeur d'une variable de l'agent
Trap evenement parti
inform l'agent peut obtenir

L'accès aux variables d'un matériel réseau de fait gracce à un mot de passe que l'on appelle la communauté
la communauté en lecture a pour valeur par defaut "public"
la communaut en écriture a pour valeur "privé"

## Les MIB

chaque objet dans la mib est identifié par un OID:
	- identifiants universels, suite d'entiers,
	- organisé hierarchiquement
	- séparés par des points
	- assurer l'interopérabilité

Un fichier MIB est écrit en ASN.1


Sous Windows, par défaut est utilisé WMI, SNMP est un composant à rajouter via l'ajout suppression de programmes.
On le gère ensuite via les services



SNMPB est un logiciel qui permet d'interroger un équipement pour trouver les OID