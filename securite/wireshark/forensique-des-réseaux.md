Premiere partie: Mesures et techniques de base.

www.kondah.com
@zyrus_wh
in/kondah
hamza@alphorm.com



Citation de l'art de la guerre: on doit connaitre notre ennemi, nos faiblesses, nos forces.

# Le Sniffing
## Définition
technique qui va permettre a un tier (attaquant, administrateur, utilisateur) de collecter les paquets circulant dans un réseau.
Cette technique va permettre d'avoir un moyen de transformer en information décisionnelle :
source destination, 

## bénéfices:
supervision des activités réseaux,
Détecter et Analyser du trafic malveillant,
Diagnostic du réseau,
Analyse Forensique,
Inspection des paquets,
Détection d'anomalies

# Wireshark
Analyseur de paquets, permet d'effectuer du dépannage et l'analyse de réseaux informatiques.
On va récuperer les paquets qui transitent dans un fichier 
C'est un outil puissant et complet qui offre de nombreuses 

il permet aussi d'aider au développement de protocoles, l'éducation et la rétro ingénierie.
Il gère plus de 1200 protocoles.

# Les filtres
C'est ce qui permet d'afficher les informations recherchées.
Ce sont des règles conventionneles appliquées par les acteurs.
Il existe deux types de filtres:
Affichage:
Filtres qu'on peut spécifier a chaque fois et qui va jouer sur l'affichage
<image filtre d'affichage>
il permet de raccourcir le nombre de paquets sans suppression


Les filtres de capture:
Ce sont des filtres qui permettent d'appliquer les règles appliquées pendant la capture.
Filtrer les paquets qu'on veut intercepter.
seulement les trames qui matchent avec le filtre sont capturées contrairement au filtre d'affichage.

Voir comme filtre de pré capture et post capture

# Création de profils
Wireshark permet de créer des profils ) chaque scénario spécifique. (détection de X, ...)
On peut associer à chaque profil:
- paramètres et réglages,
- filtres de captures,
- filtres d'affichage,
- règles de coloration.

Ca permet de prédéfinir tout ces éléments afin de ne pas avoir a les recrér plus tard.
clic droit en bas: new

# Creation de bouton
la création de bouton permet d'automatiser la création de filtres etc.
petit bouton + en haut à droite,
nom d'étiquette, filtre, OK.

# Extraction de Fichiers
Premiere manière: selon les objets de wireshark
exporter les sessions


prochainement:
webinar gratui: pentest avec metasploit
Pentest Harware: Lan Turtle et Packet Squirrel
Sécurité des réseaux avec Cisco: PArtie 2