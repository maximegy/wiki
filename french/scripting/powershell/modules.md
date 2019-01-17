<!-- TITLE: PowerShell : Modules -->
<!-- SUBTITLE: A quick summary of Modules -->

# Header

## Les Modules
LEs modules sont un moyen de constituer un agrégat de fonctions dans un fichier dans l'optique de les réutiliser plus tard. Il en existe plusieurs types.
Si vous utilisez de manière récurrente certaines fonctions, il peut alors être intéressant de créer un module.
Un module se constitue avec:
- un fichier contenant du code powershell (les modules sont des fichiers .psm1)
- D'autres modules dont le module pourrait avoir besoin
- Un dossier ou le module peut être importé
- Un manifeste, contenant les informations du module.

Les modules sont listables avec la commande `Get-Module -ListAvailable`

Voir les fonctions que rend disponilbes un module se fait avec la commande Get-Command -Module 'Module'
Les modules disponibles sont ceux qui sont stockés dans le résultat de la commande `(Get-ChildItem Env:\PSModulePath).Value.Split(';')`

Manifest:
Contient les métadatas d'un module, permet un import plus rapide, une utilisation a la volée des commandes.

### Travaux Pratiques
Récupérer le fichier "Joli_Texte.txt"
- Identifiez les fonctions du script et expiquez les
- Importez ce script en tant que modue et faites le fonctionner uniquement par des commandes
- Faites fonctionner ce script avec un autre script. Faites appel à une boucle dans ce dernier.
- Enlevez le module.


```powershell
# Renommer le fichier
Rename-Item -Path C:\... -NewName joli_texte.psm1
Move-item
Copy-item
# Déplacer
Move-Item; Copy-Item; Get-content | out-file 
# Créer dossier 
New-item -Path *path* -Type Directory
# Importer
New-ModuleManifest -Path *Path\module.psd1* -NestedModules *Path\module.psm1*
Get-Module-List-Available
Import-Module *NomDuModule*
```

utilisation : Write-Pretty "texte" "type
Write-Pretty -PrettyText "texte" -texttype "type"
Commande | Write-Pretty -textype "type"

## Ajouter de l'aide sur les scripts
Explorer l'usage d'une commande se fait avec Get-Help. Cette commande affiche alors des bocs de notes renseignées dans les fonctions et modules.


```powershell
  <#
    .SYNOPSIS 
      Displays a list of WMI Classes based upon a search criteria
    .EXAMPLE
     Get-WmiClasses -class disk -ns rootcimv2"
     This command finds wmi classes that contain the word disk. The 
     classes returned are from the rootcimv2 namespace.
  #>
```


Type de menu:
|Help Type Name|Description|
|------------------|-------------|
|`.Synopsis`|Brève description de la fonction, commence par un verbe et explique à l'utilisateur ce que fait la fonction. Ne contient pas le nom de la fonction et comment la fonction travaille.|
|`.Description`|2 ou 3 phrases  qui list brievement tout ce que la fonction peut faire. La description commence par "La fonction *nomdelafonction*...". Si la fonction peut prendre en compte plusieurs objets ou plusieurs entrées, il faut utiliser plusieurs noms dans la description.|
|`.Parameter`|Breve et minutieux. Il décrit ce que fait la fonction lorsque les paramètres sont utilisés et quelles sont les valeurs utilisées pour le paramètre.|
|`.Example`|Illustre l'utilisation de la fonction avec tout ses paramètres. Les exemples sont énoncés de la plus simple utilisation à la plus complexe.|
|`.Inputs`|Liste les classes .NET des objets que la fonction accept comme entrée.|
|`.Outputs`|Liste les classes .NET des objets que la fonction présente en sortie|
|`.Notes`|Permet d'indiquer des informations qui ne peuvent pas être placées dans les autres catégories|
|`.Link`|Liste les liens vers les autres pages internet d'explications.|


## Travaux Pratiques : Help documentation
En vous appuyant sur les déductions faites sur le script "Joli_Texte". Constituez l'aide.
Voici les éléments a faire apparaitre:
- Que font les Rando; Error; Warning et Info,
- Quels sont les paramètres et comment s'en sert-on
- Des exemples d'usages

Les paramètres qui devraient remonter..
- `Get-Help`
- `Get-Help -detailed`
- `Get-Help Write-Pretty -Parameter prettyText & textType`
- `Get-Hep Write-Pretty -Examples`