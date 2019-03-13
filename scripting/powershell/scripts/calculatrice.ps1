[string]$MainTitle = 'Calculatrice'
$global:dresultat
function Afficher-Menu
{
     param (
           [string]$Title = 'Menu Principal'
     )
     Clear-Host
     Write-Host "================ $MainTitle ================"
     Write-Host "================ $Title ================"
     Write-Host "1: addition."
     Write-Host "2: soustraction"
     Write-Host "3: division"
     Write-Host "4: multiplication"
     Write-Host "D: Dernier resultat"
     Write-Host "Q: Press 'Q' to quit."
}
function addition {
    param (
          [string]$Title = 'Addition'
    )
    Clear-Host
    Write-Host "================ $MainTitle ================"
    Write-Host "================ $Title ================"
    Write-Host "    D: Dernier résultat - Q: Quitter    "  
    $val1 = Read-Host "premiere valeur"
    while (!($val1 -match "^[\d\.]+$" -or $val1 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        else {$val1 = Read-host "valeur non numérique"}
    }
    if ($val1 -eq "d") {$val1 = $global:dresultat}
    $val2 = Read-Host "additioné de"
    while (!($val2 -match "^[\d\.]+$" -or $val2 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        else {$val1 = Read-host "valeur non numérique"}
    }
    if ($val2 -eq "d") {$val2 = $global:dresultat}
    $resultat = [decimal]$val1+[decimal]$val2
    Write-Host "$val1+$val2 = $resultat"
    $global:dresultat = $resultat
    read-host "Appuyer sur une touche pour continuer..."
}
    Write-Host -
function soustraction {
    param (
          [string]$Title = 'Soustraction'
    )
    Clear-Host
    Write-Host "================ $MainTitle ================"
    Write-Host "================ $Title ================"
    Write-Host "    D: Dernier résultat - Q: Quitter    "  
    $val1 = Read-Host "premiere valeur"
    while (!($val1 -match "^[\d\.]+$" -or $val1 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        else {$val1 = Read-host "valeur non numérique"}
    }
    if ($val1 -eq "d") {$val1 = $global:dresultat}
    $val2 = Read-Host "soustrait de"
    while (!($val2 -match "^[\d\.]+$" -or $val2 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        else {$val1 = Read-host "valeur non numérique"}
    }
    if ($val2 -eq "d") {$val2 = $global:dresultat}
    $resultat = [inT]$val1-[inT]$val2
    Write-Host "$val1-$val2 = $resultat"
    $global:dresultat = $resultat
    read-host "Appuyer sur une touche pour continuer..."
}

function division {
    param (
          [string]$Title = 'Division'
    )
    
    Write-Host "================ $MainTitle ================"
    Write-Host "================ $Title ================"
    Write-Host "    D: Dernier résultat - Q: Quitter    "  
    $val1 = Read-Host "premiere valeur"
    while (!($val1 -match "^[\d\.]+$" -or $val1 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        else {$val1 = Read-host "valeur non numérique"}
    }
    if ($val1 -eq "d") {$val1 = $global:dresultat}
    $val2 = Read-Host "divisé par"
    while (!($val2 -eq 0 -xor $val2 -match "^[\d\.]+$" -or $val2 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        elseif ($var2 -eq 0) {$var2 = Read-Host "Impossible de diviser par 0"}
        else {$var2 = Read-host "Valeur non numérique"}
    }
    if ($val2 -eq "d") {$val2 = $global:dresultat}
    $resultat = [inT]$val1/[inT]$val2
    Write-Host "$val1/$val2 = $resultat"
    $global:dresultat = $resultat
    read-host "Appuyer sur une touche pour continuer..."
}

function multiplication {
    param (
          [string]$Title = 'Multiplication'
    )
    Clear-Host
    Write-Host "================ $MainTitle ================"
    Write-Host "================ $Title ================"
    Write-Host "    D: Dernier résultat - Q: Quitter    "  
    $val1 = Read-Host "premiere valeur"
    while (!($val1 -match "^[\d\.]+$" -or $val1 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        else {$val1 = Read-host "valeur non numérique"}
    }
    if ($val1 -eq "d") {$val1 = $global:dresultat}
    $val2 = Read-Host "multiplié par"
    while (!($val2 -match "^[\d\.]+$" -or $val2 -eq "d")) {
        if ($val1 -eq "q") {Afficher-menu}
        else {$val1 = Read-host "valeur non numérique"}
    }
    if ($val2 -eq "d") {$val2 = $global:dresultat}
    $resultat = [inT]$val1*[inT]$val2
    Write-Host "$val1*$val2 = $resultat"
    $global:dresultat = $resultat
    read-host "Appuyer sur une touche pour continuer..."
}

function Dernier_resultat {
    param ()
    Clear-Host
    Write-Host "================ $MainTitle ================"
    Write-Host "Le dernier résultat est $global:dresultat"
    read-host "Appuyer sur une touche pour continuer..."
}

function coloriage {
    param ($resultat)
    if ($resultat -match "1*") {Write-Host $resultat -ForegroundColor Green}
}

do
{
    Afficher-Menu
    $input = Read-Host "Votre selection"
    switch ($input)
    {
        1 {addition}
        2 {soustraction} 
        3 {division}
        4 {multiplication}
        "d" {Dernier_resultat}
        Default {Afficher-Menu}
    }

}
until ($input -eq 'q')