```Powershell
New-ADOrganizationalUnit -Name Maxime_VINCENT -Path "OU=TP,DC=testrisr,DC=cesi"
$password = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
New-ADUser -Name maxime.vincent -Path "OU=Maxime_VINCENT,OU=TP,DC=testrisr,DC=cesi" -AccountPassword $password -enabled $true
Add-ADGroupMember -Identity risradm -Members maxime.vincent
```



```Powershell
$valeur = ('Comptabilite').Substring(0,6)
New-ADGroup "MV_$valeur" -GroupScope Global -Path "OU=Maxime_VINCENT,OU=TP,DC=testrisr,DC=cesi"
$table = "Admin","Editor","Reader"
foreach($elem in $table) {
    $group = "MV_"+"$valeur"+"_"+"$elem"
    New-ADGroup -Name "$group" -GroupScope Global -Path "OU=Maxime_VINCENT,OU=TP,DC=testrisr,DC=cesi"
    Add-ADGroupMember -Identity "MV_$valeur" -Members "$group"
}
```



```Powershell
$password = ConvertTo-SecureString -String "pwd123!!" -AsPlainText -Force

ForEach ($nom_source in "Comptabilité","Ressources-Humaines","Moyens-Generaux")
    {
    New-ADGroup -Name "MV_$nom_source" -GroupScope Global -Path "OU=Maxime_VINCENT,OU=TP,DC=testrisr,DC=cesi"
    $nom_court="MV_$($nom_source.Substring(0,6))"
    $i=1
    ForEach ($nom_extension in "Editor","Admin","Reader")
        {
        New-ADGroup -Name $nom_court"_"$nom_extension  -GroupScope Global -Path "OU=Maxime_VINCENT,OU=TP,DC=testrisr,DC=cesi"
        Add-ADGroupMember -Members $nom_court"_"$nom_extension -Identity "LG_$nom_source"
        New-ADUser "$($nom_court).user0$($i)" -AccountPassword $password -ChangePasswordAtLogon $false -Enabled $true -Path "OU=Maxime_VINCENT,OU=TP,DC=testrisr,DC=cesi"
	    Add-ADGroupMember -Members "$($nom_court).user0$($i)" -Identity "$($nom_court)_$($nom_extension)"
        $i++
        }
    }
```