<!-- TITLE: Powershell - Bases -->
<!-- SUBTITLE: Cours de base de Powershell -->
Documentation officielle : [docs.microsoft.com](https://docs.microsoft.com/en-us/powershell/#pivot=main&panel=getstarted)
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

![Powershell Ise](/uploads/powershell/powershell-ise.png "Powershell Ise"){.align-center}
* Un autre logiciel peut être pratique pour développer les scripts non seulement PowerShell mais aussi d'autres langages. Ce logiciel développé par Microsoft est disponible gratuitement en installation complète mais aussi sans droits administrateurs dans les dossiers de l'utilisateur. Il prend nativement en charge Git et de nombreuses extensions permettent de le rendre encore plus puissant. Visual Studio Code permet une reconnaissance du langage comme PowerShell_ISE. il propose aussi le débogage, l'autocompletion et l'explication des commandes tapées.  

![Visual Studio Code](/uploads/powershell/visual-studio-code.png "Visual Studio Code"){.align-center}


## Versions
Depuis sa création, PowerShell a évolué jusqu'à devenir un langage puissant et très flexible.

## Avant tout
Par défaut et par sécurité la politique de Microsoft est de restreindre l'execution de scripts. Pour vérifier la politique d'execution, lancer la commande `Get-Execution Policy` dans une console PowerShell lancée en administrateur.

4 valeurs sont possibles:
* **Restricted** : Aucun script est autorisé. C'est la politique par défaut.
* **AllSigned** : Il est possible d'executer les scripts signés par un developper de confiance. Avec cette politque, il est demandé de confirmer le lancement du script.
* **RemoteSigned** : Il est possible de lancer ses propres scripts ou les scripts signés par un developpeur de confiance.
* **Unrestricted** : On peut lancer n'importe quel script.

Pour commencer à travailler avec PowerShell, il faut configurer la politique d'execution de Restricted à RemoteSigned ou Unrestricted par la commande: `Set-ExecutionPolicy RemoteSigned`.

Terminologie:
* **Cmdlets**: essentiellement des commandes qui interagissent avec du code .NET sr des fonctions définies par les comandes
* **Scripts**: Les scripts dont des fichiers .ps1 executables qui contiennent une série de commandes Powershell
* **Fonctions**: une fonction est une série de commandes groupées qui ensemble permettent de réaliser une certaine tâche.

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




# Cmdlets
## A propos
Une cmdlet est une commande PowerShell avec une fonction prédéfinie suivant la logique "Action" - "information".
* Il existe des applets de commande système, utilisateur et personnalisé,
* Les résultats des CMDlets en sortie sont des objets ou des tableaux d'objets, il faut voir ça comme un conteneur qui contient des propriétés, imagé comme des poupées russes
exemple: 
```powershell
'Hello World'
'Hello World'.Lenght
```
* Les applets de commande peuvent obtenir des données à analyser ou transférer des données vers une autre applet de commande à l'aide de canaux,
* Les cmdlets sont insensibles à la casse, par exemple `Get-Aduser`, `get-aduser` ou encore `GeT-ADUseR` fonctionnent,
* Dans une chaine, si on veut utiliser plusieurs cmdlets, il faut les séparer par un point-virgule (`;`).

## Format
La structure d'une cmdlet consiste toujours à un **verbe** suivi d'un **nom**. Les verbes les plus connus sont:
- `Get` : pour obtenir quelque-chose,
- `Set` : pour définir quelque-chose,
- `Start` : pour executer quelque-chose,
- `Stop` : pour arrêter quelque-chose,
- `Out` : pour retourner quelque-chose,
- `New` : pour créer quelque-chose.

Commandes les plus importantes :
- "`| gm`" pour "`Get-Member`" permet de récupérer les membres, propriétés, paramètres et méthodes des objets.
- `Get-Verb` permet d'avoir une vue sur l'ensemble des verbes utilisés.
- `Get-Help` permet d'avoir des informations sur les commandes, cmdlets et autres.

"`Get-Command -CommandType Cmdlet | Group-Object Verb | Sort-Object Count -Descendig | Format-Table --Autosize`"
Les Alias (`Get-Alias`) Permettent de créer des raccourcis pour exécuter des commandes communes
`Get-Command`: Permet de découvrir les commandes par exemple toutes les commandes relatives aux processus (`Get-Command -Name "*process*"`)

Appliquons l'utilisation d'une commande sur un exemple pratique:
- `Get-Process` retourne les process
- `Get-Process | Format list` permet d'avoir une liste séparant chaque item.

Un petit mix de toutes les informations pour avoir, par exemple, les process qui consomment le plus de CPU
- `Get-Process | Select-Object Name,CPU | Sort-Object CPU -Descending | Format-Table -Autosize`
- Powershell est également en mesure d'afficher un tableau exporté en utilisant la commande Out-GridView

Les chevrons '`>`' et '`>>`' permettent respectivement d'exporter des résultats dans un fichier.
Par exemple:
```powershell
Get-Process > processes.txt
Start-Process .\processes.txt
```

Rappel d'objet avec le pipe: le pipe permet d'utiliser un objet récupéré dans une commande précédente (`Select-Objet`, `Out-File`...)
Un exemple pratique pour agir sur une machine: `Get-Process notepad | Stop-Process`

## Paramètres
Chaque CMDlet possède de nombreux paramètres permettant de personnaliser son fonctionnement. PowerShell ISE et Visual Studio Code suggèrent tous les paramètres et leur types après avoir écrit la commande suivi d'un tiret.  

![Parametres](/uploads/powershell/parametres.png "Parametres"){.align-center}

## Alias
On peut aussi créer des alias qui sont des noms de cmdlets raccourcis.
Par exemple, à la place de `Get-Help`, on peut juste entrer `Help`

```powershell
Start-Process notepad
start notepad
```

ou encore

```powershell
Stop-Process -Name notepad
spps -Name notepad
```

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




-----




-----


## Commentaires
Laisser des commentaires dans un script va vous permettre ainsi qu'aux différents utilisateurs du script de mieux comprendre ce que le script fait. Un commentaire peut être une ligne commençant par un dièze (#) ou un bloc sur plusieurs lignes commençant et finissant par des dièzes et des chevrons :

```powershell
# simple commentaire
<# commentaire
sur plusieurs
lignes #>
```


-----


## Pipes
Les pipes ( "|" - barre verticale), renvoient les données d'une cmdlet à une autre.
Par exemple :
`Get-Service | Sort-Object -property Status`
Le résultat de la commande `Get-Service` est redirigé dans la commande `Sort-Object -property Status`. Tous les services sont donc triés par leur statut.
Il est possible d'utiliser plusieurs pipes par exemple:
`Get-Service | WHERE {$_.status -eq "Running"} | SELECT displayname`
La commande liste les services, exclue les services arrêtés et affiche seulement leur nom.
Pour information : `$_` defini l'element  actuellement dans le pipe.

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


-----


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

## Write

`Write-Host` : sert à présenter de la donnée lisible sous forme de texte.
Utilie pour suivre le déroulement d'un script et présenter des menus
`Write-Output` : set à envoyer des objets dans le 'pipeline' Ce qui veut dire que le prochain objet dans le shell/script sera lisible.
`Write-Verbose` : Permet d'afficher ou non le texte associé avec l'argument -Verbose

## Variables
|Types|Description|
|------|-------------|
|array|liste de valeurs|
|bool|valeur booléenne (Vrai ou Faux)|
|byte|nombre en 8 bits|
|char|suite de charactère en 16bits|
|decimal|nombre pouvant comprendre un point en 128 bits|
|single|nombre pouvant comprendre un point en 32 bits|
|double|nombre pouvant comprendre un point en 64 bits|
|hashtable|Stocker des objets sous forme de clé-valeur (key-value)|
|int|entier sur 32 bits|
|long| entier sur 64 bits|
|string|chaine de caractère Unicode (2 milliards de caractères)|
|xml|objet XML|




-----


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


-----


# Les Comparateurs
Les comparateurs permettent de specifier les conditions de comparaison des valeurs et de déterminer les valeurs qui correspondent aux modèles spécifiés.
|Type|Opérateur|Description|
|-----|------------|------------|
|Egalité|`-eq`|égal à|
||`-ne`|n'est pas égal à|
||`-gt`|plus grand que|
||`-ge`|plus grand ou égal|
||`-lt`|plus petit que|
||`-le`|plus petit ou égal|
||`-c`|placé devant l'opérateur, active la sensibilité à la casse ex : `-ceq`|
||`-i`|placé devant l'opérateur, explicite l'insensibilité à la casse ex : `-ieq`|
|Correspondance|`-like`|Retourne Vrai si la chaine correspond au motif|
||`notlike`|Retourne Vrai si la chaine ne correpond pas au motif|
||`match`|Retourne vrai si la chaine correspond à l'expression régulière|
||`notmatch`|Retourne vrai si la chaine ne correspond pas à l'expression régulière
|||`$match`contient la chaîne correspondant à l'expression régulière|
|Contenant|`-contains`|Retourne vrai quand le motif de référence est contenu dans  le motif|
||`-notcontains`|Retourne vrai quand le motif de référence n'est pas contenu dans  le motif|
||`-in`|Retourne vrai quand la valeur testée est contenue dans le motif|
||`-notin`|Retourne vrai quand la valeur testée n'est pas contenue dans le motif|
|Type|`-is`|Retourne vrai si les deux objets sont de même type|
||`-isnot`|Retourne vrai si les objets ne sont pas de même type|


## Travaux pratiques - Scripts
Créer une calculatrice:
elle doit gérer les 4 opérations de base,
Elle doit retourner une erreur si les valeurs renseignées par l'utilisateur ne sont pas valides,
Gestion des décimales
Afficher des couleurs différentes pour un nombre de chiffres d'entiers différents devant la virgule (1 => Bleu, 2 => Rouge, 3 => Noir, etc)
Intégrer des debug et des verboses, qui commentent les actions entreprises par le script au fur et à mesure
elle ne doit pas se fermer tant que l'utilisateur ne l'a pas demandé