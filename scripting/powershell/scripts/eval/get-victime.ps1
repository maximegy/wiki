<#
.SYNOPSIS
  <Ce script permet de tirer au sort une ou plusieurs victimes à partir d'un fichier spécifié>

.DESCRIPTION
  <Ce script permet de tirer au sort une ou plusieurs victimes à partir d'un fichier spécifié
    Il comporte des options:
        - VictimList : le chemin vers le fichier des victimes
        - Number : le nombre de victimes à tirer au sort
        - Fake : paramètre de triche, renseigne le nom du tricheur pour ne pas q'il soit tiré
        - Sumup : lister toutes les victimes qui ont été tirées>

.PARAMETER VictimList
    <Chemin absolu ou relatif vers le fichier .txt des victimes>

.PARAMETER VictimNumber
    <Nombre de victimes à tirer>

.PARAMETER Fake
    <Activation de la triche:
        Initialiser par $True
        Remplace son nom par un autre>

.PARAMETER Sumup
    <affichage des dernieres victimes:
        Initialiser par $True
        Affiche les dernieres victimes>

.INPUTS
  < Minimum:
  Chemin vers le fichier de victimes
  Nombres de victimes
  Facultatif:
  Fake
  Sumup
  debug
  verbose>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.1
  Author:         <Maxime VINCENT>
  Creation Date:  <15/03/2019>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Get-Victim -VictimList ".\victim_list.txt" -VictimNumber 5
  Get-Victim -VictimList ".\victim_list.txt" -VictimNumber 5 -Sumup $True>
  Get-Victim -VictimList ".\victim_list.txt" -VictimNumber 5 -Fake $True
  Get-Victim ".\victim_list.txt" 5 $True
#>


function Tirage {
    param(
        [parameter(position=1)]
        $VictimList,
        [parameter(position=2)]
        $Fake,
        [parameter(position=3)]
        $tricheur
    )
    Write-Debug -Message "Entre dans la fonction Random"
    Write-Debug -Message "Randomize Victim"
    Write-Verbose -Message "Tirage au sort ..."
        $victime = $(Get-Content -Path $VictimList | Get-Random)
    Write-Debug -Message "la victime du premier tirage est $victime"

    Write-Verbose -Message "Comparaison avec l'ancienne victime"
    Write-Debug -Message "Comparaison avec l'ancienne victime"
        if ($Global:OldVictime) {
            Write-Debug -Message "l'ancienne victime est $Global:OldVictime"
            while ($Global:OldVictime -eq $victime) {
                Write-Debug -Message "victime déjà tirée; $victime = $Global:OldVictime; Remplacement de la victime"
                    $victime = $(Get-Content -Path $VictimList | Get-Random)
            }
            Write-Debug -Message "la victime du second tirage est $victime"
        }


    Write-Debug -Message 'Teste la variable $Fake'
    Write-Verbose -Message "Test du paramètre de triche"
        if ($Fake) {
            Write-Debug -Message '$Fake = True; Remplacement de la victime'
            while (($victime -eq $tricheur) -and ($victime -eq $Global:OldVictime)) {
                Write-Debug -Message "victime = tricheur; $victime = $tricheur; Remplacement de la victime"
                    $victime = $(Get-Content -Path $VictimList | Get-Random)
                Write-Debug -Message "la victime est $victime"
            }
            Write-Debug -Message "la victime du troisième tirage est $victime"
        }
        else {
            Write-Debug -Message 'Pas de triche...'
        }
    Write-Debug -Message "la victime chosie est $victime"
    Write-Verbose -Message "la victime chosie est $victime"
    $Global:OldVictime = $victime
    return $victime
}

function Archivage {
    param (
        # Récupère la victime chosie par la fonction random
        [Parameter(position=1)]
        [string]
        $victime
    )
    Write-Debug -Message "entre dans la fonction Archivage"
    Write-Debug -Message "Teste la présence du dossier de la victime"
    if ((Test-Path ".\VictimsFolder\$victime") -eq $False) {
        Write-Debug -Message "Le dossier n'existe pas, création du dossier"
        New-Item -Path ".\VictimsFolder\" -Name $victime -ItemType Directory
    }
    Write-Debug -Message "Création de la var du path du fichier de l'utilisateur"
    $victimelogpath = ".\VictimsFolder\"+"$victime"+"\"+"$victime"+".txt"
    $date = $(Get-Date)
    Write-Debug -Message "ajout de l'entree dans le fichier de la victime"
    Add-Content $victimelogpath $date
    Write-Debug -Message "ajout de l'entree dans le fichier Manifest"
    Add-Content .\Manifest.txt "$victime choisi le $date `n"
}

function Get-Victim {
    [CmdletBinding()]
        param(
            # Liste de victimes
            [Parameter(Mandatory=$True, position=1)]
            [string]
            $VictimList,
            # Nombre de tirages
            [Parameter(Mandatory = $True, position=2)]
            [int]
            $VictimNumber,
            # Truquer les résultats
            [Parameter(Mandatory = $False, position=3)]
            [bool]
            $Fake,
            # Lister les derniers résultats
            [Parameter(Mandatory=$False, position=4)]
            [bool]
            $Sumup
        )
    
    # INIT
    Write-Debug -Message "Initialisation"
    Write-Verbose -Message "Initialisation"
        $Global:OldVictime = $null
        $i = 0
        if ((Test-Path ".\VictimsFolder") -eq $False) {
            Write-Debug -Message "Création du dossier des victimes"
            New-Item -Name "VictimsFolder" -ItemType Directory
        }
        if ((Test-Path ".\Manifest.txt") -eq $False) {
            Write-Debug -Message "Création du manifeste"
            New-Item -Name "Manifest.txt" -ItemType file
        }
        if ($Fake) {
            $tricheur = $(Read-Host "Nom du tricheur")
            }

    Write-Verbose -message "Lancement de Get-Victim"
    Write-Debug -Message "$VictimNumber - $i"
    Write-Debug -message "Test du Chemin"
    Write-Verbose -message "Test du Chemin"
        While ((Test-Path $VictimList) -eq $False) {
            Write-Debug -message "Le chemin $VictimList n'existe pas"
            Write-Host "Le fichier n'existe pas"
            $VictimList = $(Read-Host "Merci d'indiquer un Chemin valide")
        }
    Write-Debug -message "Test de la variable Sumup"
    Write-Debug -message "Variable Sumup a $Sumup"
    Write-Verbose -message "Test de la variable Sumup"
        if ($Sumup) {
            Write-Debug -message "Affichage du contenu du manifest"
            Write-Verbose -message "Affichage du contenu du manifest"
            Write-Host $(Get-Content -Path .\Manifest.txt)
            exit
        }

    Write-Debug -message "Lancement des tirages au sort"
    Write-Verbose -message "Lancement des tirages au sort"
    While ($i -lt $VictimNumber) {
        write-Host "$i / $VictimNumber"
        Archivage $(Tirage $VictimList $Fake $tricheur)
        $i++
    }
}

Get-Victim ".\victim_list.txt" 5 $True