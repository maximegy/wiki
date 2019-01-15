<!-- TITLE: Powershell - Bases -->
<!-- SUBTITLE: Cours de base de Powershell -->

# Algorithmique de Base
Mettre un utilisateur dans un groupe:
![Algorithmique](/uploads/powershell/algorithmique.png "Algorithmique"){.align-center}

# Présentation
## Introduction
Powershell est la volonté de Microsoft de fournir une platefoerme d'automatisation, de scripting et d'une variété d'autres fonctions afin de concurrencer les shells du marché:
- Fournir une vraie interface robuste d'administration scriptée
- Offrir une logique dans les commandes "verbe-nom"

## Versions


# Personnalisation du Shell
| Personnalisation de Base | Personnalisation avancée |
|--------------------------|--------------------------|
|![Personnalisation Powershell](/uploads/powershell/personnalisation-powershell.png "Personnalisation Powershell")|Le fichier de profil individuel est stocké dans la variable ||$profile.CurrentUserAllHosts|
||Le fichier de profil global $profile.AllUsersAllHosts|
||Les fichiers de profils sont chargés au lancement d'un shell, ils permettent de customiser les environnements utilisateurs et système.|
||La function function Prompt { } permet de modifier les informations retournées par le prompt.|

clic droit > personnaliser

Personnalisation avancée
Le fichier de profil individuel est stocké dans la variable $profile.CurrentUserAllHosts
Le fichier de profil global $profile.AllUsersAllHosts
Les fichiers de profils sont chargés au lancement d'un shell, ils permettent de customiser les environnements utilisateurs et système.
La function function Prompt { } permet de modifier les informations retournées par le prompt.

## Travaux Pratiques:
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

# Cmdlets
Les cmdlets:
Les commandes suivent la logique "Actions" - "information"
objet : voir ça comme un conteneur qui contient des propriétés etc "visu comme des poupées russes
exemple 'Hello World'
'Hello World'.Lenght

Commandes la plus importante "`| gm`" pour "`Get-Member`"

La structure est Verbe+Nom
La commande `Get-Verb` permet d'avoir une vue sur l'ensemble des verbes utilisés dans le monde Powershell
"`Get-Command -CommandType Cmdlet | Group-Object Verb | Sort-Object Count -Descendig | Format-Table --Autosize`"
Les Alias (`Get-Alias`) Permettent de créer des raccourcis pour exécuter des commandes communes
`Get-Command`: Permet de découvrir les commandes par exemple toutes les commandes relatives aux processus (`Get-Command -Name "*process*"`)

Appliquons l'utilisation d'une commande sur un exemple pratique:
- `Get-Process` retourne les process
- `Get-Process` | Format list permet d'avoir une liste séparatn chaque item

Un petit mix de toutes les informations pour avoir par exmple les process qui consomment le plus de CPU
- `Get-Process | Select-Object Name,CPU | Sort-Object CPU -Descending | Format-Table -Autosize`
- Powershell est également en mesure d'afficher un tableau exporté en utilisant la commande Out-GridView

Les chevrons '`>`' et '`>>`' permettent respectivement d'exporter des résultats dans un fichier.
Par exemple:
```powershell
Get-Process > processes.txt
Start-Process .\processes.txt
```

Rappel d'objet avec le pipe: le pipe permet d'utiliser un objet récupéré dans une commande précédente (`Select-Objet`, `Out-File`...)
Un exemple pratique pour agir dur une machine: `Get-Process notepad | Stop-Process`

## Travaux Pratiques
Premier script:
Créez un script permettant :
|Tâche|Bon ordre|Commande|
|------|-----------|-------------|
|Exporter les process en cours sur votre machine sur un fichier texte, en triant par celui consommant le plus de ressources au choix. Si vous le souhaitez, n'affichez que des informations que vous jugez utiles.|laisser le choix à l'utilisateur de où est créé le fichier|`$dossier = Read-Host "Veuillez renseigner le dossier"`<br/> `$fichier = Read-Host "Nom du fichier"` <br/> `$chemin = "$dossier\$fichier"` <br/> `Write-Host "L'export sera fait dans le fichier : $chemin"
`|
|Ouvrir ce fichier texte après sa création|vérifier que le dossier où le fichier est créé existe et si non, le créer|`if (!(Test-Path -Path $dossier)) {New-Item -ItemType "directory" -Path $dossier}`|
|de le fermer automatiquement après 30 secondes|Exporter les process en cours sur votre machine sur un fichier texte, en triant par celui consommant le plus de ressources au choix. Si vous le souhaitez, n'affichez que des informations que vous jugez utiles|`Get-Process | Select-Object Name,CPU | Sort-Object CPU -Descending | Out-File -FilePath $chemin`|
|de supprimer ce fichier nouvellement créé|Ouvrir ce fichier texte après sa création|`notepad.exe $chemin`|
|de vérifier que le dossier où le fichier est créé existe et si non, le créer|de le fermer automatiquement après 30 secondes|`Start-Sleep -Seconds 10 & Get-Process *notepad* | Stop-Process`|
|Bonus, laisser le choix à l'utilisateur de où est créé le fichier|de supprimer ce fichier nouvellement créé|`Remove-Item $chemin`|