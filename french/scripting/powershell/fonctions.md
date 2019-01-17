<!-- TITLE: PowerShell - Fonctions -->
<!-- SUBTITLE: A quick summary of Fonctions -->

# Header

## Les Fonctions
Rappel: les fonctions sont des successions de commandes regroupées dans le but de réaliser certaines tâches
Reprenons un script blanc et créons une fonction vierge dans le fichier:

```powershell
function Get-OSInfo {
Write-Host "This function will dipslay OS information"
$osInfo = Get-WmiObject -Class Win32_OperatingSystem
Return $osInfo
}
Get-OSInfo
```

### Passer des variables en paramètre de la fonction
La fonction est utilisée par son nom.
Si on veut mettre des variables ou des données en entrée de la fonction il faut dans la fonction déclarer les positions de paramètres ainsi que la variable rattachée:

```powershell
function mafonction {
  param (
        [parameter(position=1)]
        $X,
        [parameter(position=2)]
        $Y,
        [parameter(position=3)]
        $ntry,
        [parameter(position=4)]
        $number
    )
}
```


## Travaux Pratiques - les fonctions
Affinez votre fonction afin qu'elle remonte les informations suivantes:
- la version de Windows en cours sur votre machine
- Tous les disques disponibles ainsi que l'espace disponible sur chaque disque
- Le disque sur lequel est installé Windows et son chemin d'installation
- Le langage du système
Prenez soin de formater les résultats.


```powershell
function Get-OSInfo {
    $OS = Get-WmiObject -Class Win32_OperatingSystem
    $Culture = Get-Culture
    $Drive = Get-PSDrive -PSProvider 'FileSystem'
    Write-Host "version : $($OS.Version)"
    Write-Host "Language : $($Culture.DisplayName)"
    Write-Host "Disque Install : $($OS.SystemDrive)"
    Write-Host "Disques Disponibles : $($Drive.Name): $($Drive.Free/1gb)"
    }
Get-OSInfo
```


## Travaux Pratiques - Personnalisation du Shell
| Personnalisation de Base | Personnalisation avancée |
|--------------------------|--------------------------|
|![Personnalisation Powershell](/uploads/powershell/personnalisation-powershell.png "Personnalisation Powershell")|Le fichier de profil individuel est stocké dans la variable `$profile.CurrentUserAllHosts` <br/> Le fichier de profil global `$profile.AllUsersAllHosts` <br/> Les fichiers de profils sont chargés au lancement d'un shell, ils permettent de customiser les environnements utilisateurs et système. <br/> La function function Prompt { } permet de modifier les informations retournées par le prompt.|

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

## Travaux pratiques - Calculatrice

Créer une calculatrice:
elle doit gérer les 4 opérations de base,
Elle doit retourner une erreur si les valeurs renseignées par l'utilisateur ne sont pas valides,
Gestion des décimales
Afficher des couleurs différentes pour un nombre de chiffres d'entiers différents devant la virgule (1 => Bleu, 2 => Rouge, 3 => Noir, etc)
Intégrer des debug et des verboses, qui commentent les actions entreprises par le script au fur et à mesure
elle ne doit pas se fermer tant que l'utilisateur ne l'a pas demandé
