<!-- TITLE: Powershell - Bases -->
<!-- SUBTITLE: Cours de base de Powershell -->

# Algorithmique de Base
Mettre un utilisateur dans un groupe:
![Algorithmique](/uploads/powershell/algorithmique.png "Algorithmique"){.align-center}
Powershell est la volonté de Microsoft de fournir une platefoerme d'automatisation, de scripting et d'une variété d'autres fonctions afin de concurrencer les shells du marché:
- Fournir une vraie interface robuste d'administration scriptée
- Offrir une logique dans les commandes "verbe-nom"

Versions:

Les cmdlets:
Les commandes suivent la logique "Actions" - "information"
objet : voir ça comme un conteneur qui contient des propriétés etc "visu comme des poupées russes
exemple 'Hello World'
'Hello World'.Lenght

Commandes la plus importante "| gm" pour "Get-Member"

Personnalisation du Shell
clic droit > personnaliser

Personnalisation avancée
Le fichier de profil individuel est stocké dans la variable $profile.CurrentUserAllHosts
Le fichier de profil global $profile.AllUsersAllHosts
Les fichiers de profils sont chargés au lancement d'un shell, ils permettent de customiser les environnements utilisateurs et système.
La function function Prompt { } permet de modifier les informations retournées par le prompt.