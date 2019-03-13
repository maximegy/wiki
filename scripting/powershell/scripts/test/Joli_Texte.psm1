<#
.SYNOPSIS
  <Ce script Permet de colorier différemment du texte, mot par mot, selon un argument>

.DESCRIPTION
  <Ce script Permet de colorier différemment du texte, mot par mot, selon les arguments Random (couleurs aléatoires), Error (Rouge et Blanc), Warning (Bleu et Blanc et Info (Vert et Blanc)>

.PARAMETER prettyText
    <Texte à traiter>

.PARAMETER textType
    <type de texte :
    Random  : couleurs aléatoires
    Error   : Rouge et Blanc
    Warning : Bleu et Blanc
    Info    : Vert et Blanc>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.1
  Author:         <GODARD Lionel>
  Creation Date:  <16/01/2019>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Write-Pretty -prettyText "Hello World" -textType Random>

#>


function Write-Pretty {
	[cmdletbinding()]
		param(
		[Parameter(
		Mandatory = $True,
		ValueFromPipeline = $True
		)]
		[Alias('Text')]
		$prettyText,
		[Parameter(Mandatory=$false)]
		[Alias('Type')]
		$textType
		)

	Begin {
		Write-Host `n
	}
	Process { #Permet de gérer la pipeline
		ForEach ($textItem in $prettyText) {
		Switch ($textType) {
			{$_ -eq 'Random'} {
				Write-Host -NoNewline "[" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15) 
				Write-Host -NoNewline "R" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)
				Write-Host -NoNewline "andom" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)
				Write-Host -NoNewline "]" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)
				$writeText  = $textItem.ToString().Split(' ')
					ForEach ($text in $writeText) {
					Write-Host -NoNewLine " $text" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)
					}

				Write-Host `n
			}
			{$_ -eq 'Error'} {
				Write-Host -NoNewline "[" -ForegroundColor White 
				Write-Host -NoNewline "Error" -ForegroundColor Red -BackgroundColor DarkBlue
				Write-Host -NoNewline "]" -ForegroundColor White 
				Write-Host " $textItem" -ForegroundColor Red 
			}
			{$_ -eq 'Warning'} {
				Write-Host -NoNewline "[" -ForegroundColor White
				Write-Host -NoNewline "Warning" -ForegroundColor Yellow -BackgroundColor Blue
				Write-Host -NoNewline "]" -ForegroundColor White
				Write-Host " $textItem" -ForegroundColor Yellow
			}
			{$_ -eq 'Info' -or $_ -eq $null} {

				Write-Host -NoNewline "[" -ForegroundColor White
				Write-Host -NoNewline "Info" -ForegroundColor Green -BackgroundColor Black
				Write-Host -NoNewline "]" -ForegroundColor White
				Write-Host " $textItem" -ForegroundColor White
			}
			Default { 

			Write-Host $textItem
			}
		}
	}
	}
	
	End {
	Write-Host `n
	}

}