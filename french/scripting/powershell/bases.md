<!-- TITLE: Powershell - Bases -->
<!-- SUBTITLE: Cours de base de Powershell -->

# Algorithmique de Base
Mettre un utilisateur dans un groupe:
![Algorithmique](/uploads/powershell/algorithmique.png "Algorithmique"){.align-center}


-----


# Présentation
## Introduction
Powershell est la volonté de Microsoft de fournir une platefoerme d'automatisation, de scripting et d'une variété d'autres fonctions afin de concurrencer les shells du marché:
- Fournir une vraie interface robuste d'administration scriptée
- Offrir une logique dans les commandes "verbe-nom"
PowerShell offre à la fois une console en ligne de commande et un environnement de scripting intégré.
* Pour lancer la console PowerShell, tapez PowerShell.exe dans le menu Démarrer de Windows. 
![Console Powershell](/uploads/powershell/console-powershell.png "Console Powershell"){.align-center}
* Pour lancer PowerShell ISE, tapez powershell_ise.exe dans le menu démarrer. Cet environnement est un bon moyen de travailler sur les scripts car il fournit notamment l'auto completion, la coloration du code et les fonctionnalités d'automatisation et de simplification de développement et test de code.
* 


## Versions
Depuis sa création, PowerShell a évolué jusqu'à devenir un langage puissant et très flexible.


-----


# Personnalisation du Shell
| Personnalisation de Base | Personnalisation avancée |
|--------------------------|--------------------------|
|![Personnalisation Powershell](/uploads/powershell/personnalisation-powershell.png "Personnalisation Powershell")|Le fichier de profil individuel est stocké dans la variable `$profile.CurrentUserAllHosts` <br/> Le fichier de profil global `$profile.AllUsersAllHosts` <br/> Les fichiers de profils sont chargés au lancement d'un shell, ils permettent de customiser les environnements utilisateurs et système. <br/> La function function Prompt { } permet de modifier les informations retournées par le prompt.|


## Travaux Pratiques - Personnalisation du Shell
Personnaliser son shell pour que chaque ligne retourne l'heure, l'emplacement actuel, l'utilisateur actuel...
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




-----

# Terminologie
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

## Travaux Pratiques - les CMDlets
Premier script:
Créez un script permettant :
|Tâche|Bon ordre|Commande|
|------|-----------|-------------|
|Exporter les process en cours sur votre machine sur un fichier texte, en triant par celui consommant le plus de ressources au choix. Si vous le souhaitez, n'affichez que des informations que vous jugez utiles.|laisser le choix à l'utilisateur de où est créé le fichier|`$dossier = Read-Host "Veuillez renseigner le dossier"`<br/> `$fichier = Read-Host "Nom du fichier"` <br/> `$chemin = "$dossier\$fichier"` <br/> `Write-Host "L'export sera fait dans le fichier : $chemin"`|
|Ouvrir ce fichier texte après sa création|vérifier que le dossier où le fichier est créé existe et si non, le créer|`if (!(Test-Path -Path $dossier)) {New-Item -ItemType "directory" -Path $dossier}`|
|de le fermer automatiquement après 30 secondes|Exporter les process en cours sur votre machine sur un fichier texte, en triant par celui consommant le plus de ressources au choix. Si vous le souhaitez, n'affichez que des informations que vous jugez utiles|`Get-Process | Select-Object Name,CPU | Sort-Object CPU -Descending | Out-File -FilePath $chemin`|
|de supprimer ce fichier nouvellement créé|Ouvrir ce fichier texte après sa création|`notepad.exe $chemin`|
|de vérifier que le dossier où le fichier est créé existe et si non, le créer|de le fermer automatiquement après 30 secondes|`Start-Sleep -Seconds 10 & Get-Process *notepad* | Stop-Process`|
|Bonus, laisser le choix à l'utilisateur de où est créé le fichier|de supprimer ce fichier nouvellement créé|`Remove-Item $chemin`|


-----


# Utiliser l'ISE
Créons un fichier de script, par exemple ISE_1.ps1:
Ajouter Get-Date en ligne 1 et cliquer sur la fenêtre d'execution verte afin d'obtenir le résultat retourné par le script
Ajouter un nouvelle commande ; `Get-WMIObject-Class Win32_LogicalDisk` et constater le résultat à nouveau
Essayons de personnaliser un peu ce script pour qu'il nous accueuille avec la date et nous donne la taille disponible sur le disque C: uniquement.  `Get-WMIObject-Class Win32_LogicalDisk | Where-Object DeviceID -eq "C:" | Select-Object DeviceID,Size`


-----


# Les Fonctions
Rappel: les donctions sont des successions de commandes regroupées dans le but de réaliser certaines tâches
Repronons un script blanc et créons une fonction vierge dan le fichier:

```powershell
function Get-OSInfo {
Write-Host "This function will dipslay OS information"
$osInfo = Get-WmiObject -Class Win32_OperatingSystem
Return $osInfo
}
Get-OSInfo
```

## Travaux Pratiques - les fonctions
Affinez votre fonction afin qu'elle remonte les informations suivantes:
- la version de Windows en cours sur votre machine
- Tous les disques disponibles ainsi que l'espace disponible sur chaque disque
- Le disque sur lequel est installé Windows et son chemin d'installation
- Le langage du système
Prenez soin de formater les résultats.

# CMDlet-like
Afin d'améliorer les fonctions, il est possible d'ajouter une fonctionnalité Powershell simple à cette dernière [cmdletbinding()]

```powershell
function Invoke-AdvancedFunctionality {
[cmdletbinding()]
param()
	Write-Verbose "Cette fonction est maintenant avancée !"
}
Invoke-AdvancedFunctionality
```

Les différents 'Write'
Host: sert à présenter de la donnée lisible sous forme de texte.
Utilie pour suivre le déroulement d'un script et présenter des menus
Output: set à envoyer des objets dans le 'pipeline' Ce qui veut dire que le prochain objet dans le shell/script sera lisible.
Verbose: Permet d'afficher ou non le texte associé avec l'argument -Verbose

Les types:
|array|liste|
|bool|true or false|
|byte|nombre en 8 bits|
|char|suite de charactère en 16bits|
|decimal|nombre pouvant comprendre un point en 32 bits|
|double|nombre pouvant comprendre un point en 32 bits|
|hashtable||
|int||
|single||
|string||
|xml||

## Travaux pratiques 
Créer une calculatrice:
elle doit gérer les 4 opérations de base,
Elle doit retourner une erreur si les valeurs renseignées par l'utilisateur ne sont pas valides,
Gestion des décimales
Afficher des couleurs différentes pour un nombre de chiffres d'entiers différents devant la virgule (1 => Bleu, 2 => Rouge, 3 => Noir, etc)
Intégrer des debug et des verboses, qui commentent les actions entreprises par le script au fur et à mesure
elle ne doit pas se fermer tant que l'utilisateur ne l'a pas demandé


# Les boucles
Il y a plusieurs types de boucles en Powershell. Plusieurs peuvent servir le même but, mais il y a souvent une plus adaptée qu'une autre par cas.
## La boucle ForEach

```powershell
ForEach ($element in $listeelement) {
Faire quelque chose
}
```

L'élément peut être une dénomination de votre choix.
$element vaut l'item de la liste d'element traité au niveau de la boucle:
|liste|tour de boucle| valeur de `$element`|
|----|----------------|----------------------|
|toto|1|toto|
|tata|2|tata|
|titi|3|titi|
Liste element vient d'une source, par exemple récupérée lrs d'une autre commande.
Exemple:

```powershell
$process = Get-Process
$i = 1
ForEach ($proc in $process)
	Write-Host "le process numéro $i est $($process.Name)"
	$i++
}
```


 ## La boucle For
 for (initialiser;condition;repetition) {
 FaireQuelquechose
 }
 
 Par exemple

```powershell
 for ($i=1;$i -le 15; $i++ {
	 Write-Host "Ceci est la couleur $i" -ForegroundColor $I
}
```


Les conditions sont au choix pouvant créer une boucle infinie

```powershell
for () { Write-Host "Wheeeeeeeeeeee!"}
```


On privilégiera les boucles For lorsqu'on veut exécuter un même ensemble de code plusieurs fois, pour une raison ou une autre.

## La boucle While
les boucles While continuent tant qu'une condition est vraie

While (condition)

on peut par exemple ouvrir plusieurs instances d'un programme
$notepad = Get-Process Notepad
While ($notepad.Count -le 5)


## La boucle Do While
La différence avec la boucle While, l'action se fera systématiquement au moins une fois
Do {

}


## La boucle Do Until
Très similaire à Do While, 'utilisation est à déterminer au cas par cas.

# Les Comparateurs