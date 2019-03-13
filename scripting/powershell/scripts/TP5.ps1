$Global:MainTitle="What a Game!"
function main_menu {
    param (
          [string]$Title = 'Menu Principal'
    )
    Clear-Host
    Write-Host "================ $MainTitle ================"
    Write-Host "================ $Title ================"
    Write-Host "1: Jouer"
    Write-Host "2: Dernier Score"
    Write-Host "Q: Press 'Q' to quit."
}

function difficult_menu {
    param (
          [string]$Title = 'Choix de la difficulté'
    )
    Clear-Host
    Write-Host "================ $MainTitle ================"
    Write-Host "================ $Title ================"
    Write-Host "1: Facile"
    Write-Host "2: Normal"
    Write-Host "3: Difficile"
    Write-Host "Q: Press 'Q' to quit."
    
    $input = Read-Host "Votre selection"
    switch ($input)
    {
        1 {
            $difficulty=0.8
            parameters $difficulty 
        }
        2 {
            $difficulty=0.6
            parameters $difficulty
        } 
        3 {
            $difficulty=0.4
            parameters $difficulty
        }
        "R" {
            break;
        }
        "q" {exit}
        Default {main_menu}
    }
}

function parameters {
    param (
        [parameter(position=1)]
        $difficulty
    )
    Write-Host "$difficulty"
    [int]$X = Get-Random -InputObject (1..50) | Where-Object {$_ -notin 45..50}
    [int]$Y = Get-Random -InputObject ($X..50) | Where-Object {$_ -notin $X}
    [int]$number = Get-Random -InputObject ($X..$Y)
    $ntry = ($Y-$X)*$difficulty
    Write-Host "$ntry"
    $ntry = [math]::round($ntry)
    Write-Host "$ntry"
    Write-Host "x $X . y $Y . nombre a trouver $number . tests $ntry"
    game $X $Y $ntry $number
}

function game {
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
    Write-Host "Essayez de trouver un nombre"
    Write-Host "Entre $X et $Y en $ntry essais"
    for ($i=1;$i -le $ntry;$i++) {
        $retry=$ntry-$i+1
        [int]$choice = Read-Host "Il vous reste $retry essais. Quel nombre ?"
        if (($choice -lt $X) -or ($choice -gt $Y)) {
            Write-Host "Hors limites"
            $i=$i--
        }
        elseif ($choice -lt $number) {Write-Host "Plus Haut"}
        elseif ($choice -gt $number) {Write-Host "Plus Bas"}        
        elseif ($choice -eq $number) {
            Write-Host "Bravo"
            $Global:lastresult = "Trouvé $number entre $X et $Y en $i essais"
            Read-Host "Appuyer sur une touche pour continuer"
            break;
        }
    }
    if ($i -ge $ntry) {
        Write-Host "Vous etes nul"
        Read-Host "Appuyer sur une touche pour continuer"
        Read-Host "Vous devriez quitter"
        Read-Host "Vraiment"
    }
    break;
}

function lastresult {
    Clear-Host
    Write-Host "================ $MainTitle ================"
    Write-Host "================ $Title ================"
    Write-Host "$Global:lastresult"
    Read-Host "Appuyer sur une touche pour continuer"
}

do
{
    main_menu
    $input = Read-Host "Votre selection"
    switch ($input)
    {
        1 {difficult_menu}
        2 {lastresult}
        Default {Afficher-Menu}
    }

}
until ($input -eq 'q')