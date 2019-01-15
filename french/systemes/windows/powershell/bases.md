<!-- TITLE: Powershell - Bases -->
<!-- SUBTITLE: Cours de base de Powershell -->

# Algorithmique de Base
Mettre un utilisateur dans un groupe:
![Algorithmique](/uploads/powershell/algorithmique.png "Algorithmique"){.align-center}

# Présentation
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

Travaux Pratiques:
Personnaliser son shel pour que chaque ligne retourne l'heure, l'emplacement actuel, l'utilisateur actuel...
Faire en sorte que le message d'accueil du shell teste votre,connexion vers google.com avec un message en fonction du succès ou de l'échec
Changer la couleur de la police du message du shell uniquement

```powershell
function prompt { 
    $date=$(Get-Date)
    $location=$(Get-Location)
    $user=$env:USERNAME
    Write-Host "$date $location $user" -NoNewline -ForegroundColor Green
    return ">"}
if (Test-Connection google.fr -Count 1) {Write-Host "Connection Google.fr OK"} else {Write-Host "Connection Google.fr NOK"}
```

Terminologie:
Cmdlets: essentiellement des commandes qui interagissent avec du code .NET sr des fonctions définies par les comandes
Scripts: Les scripts dont des fichiers .ps1 executables qui contiennent une série de commandes Powershell
Fonctions: une fonction est une série de commandes groupées qui ensemble permettent de réaliser une certaine tâche.
