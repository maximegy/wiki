# Kubernetes

Mot d'origine grecque signifiant "timonier", celui qui gouverne la barre du bateau,
Solution Open Source origine de Google puis maintenu par CNCF
Inspiré du projet Borg dont Google se sert en interne depuis des années,
développé avec des partenaires: Red Hat, CoreOS, IBM, Microsoft, Mesosphere, VMWare, HP...
écrit en Go,
peut tourner en local, sur le cloud (GCE, AWS, Azure), sur des machines physiques.
Kuernetes REST API
L'objectif est de gérer directement des applications et non plus des machines.

# Que permet Kubernetes
Déployer une application sous forme de containers rapidement et de manière prévisible, 
Automatiser le déploiement et la réplication de containers,
Optimiser les containers en groupes et faire du Load Balancing,
Déclarer l'architecture cible (nombre de pods, contenu, stratégie de mise à jour, ...) et laisser le système travailler à maintenir cette cible,
Faire des mises à jour sans interruption de service,
Séparer l'application de l'architecture sous-jacente,
Détecter les problèmes et les résoudre tout seul,
