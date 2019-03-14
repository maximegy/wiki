On va parfois avoir des jobs de scripts qui prennent du temps.
Les jobs permettent d'exécuter des blocks d'instructions en tâche de fond. Il est possible de paralléliser l'exécution de plusieurs Jobs et d'en recevoir des ingormations en temps réel.
Le meilleur moyen de recevoir des informations d'un Job en cours est l'utilisation d'une boucle While.
Le lancement d'un Job se fait au moyen de la commande `Start-Job`
```Powershell
Start-Job -Name SleepProcess -ScriptBlock {Start-Sleep -Seconds 60; Get-Process}
```
Pour controler les jobs en cours on utilisera Get-Job.

La collecte des informations des Jobs se fait au moyen de la commande Receive-Job [-id]. L'argument -keep permet de conserver les inforamtions du Jub concerné.
Poershell stocke les informations de ses jobs dans des 'child jobs"
Pour accéder aux informations du job, il convient d'accéder à ces derniers.
```Powershell
$ourOutput = Start-Job -Name GetOutput -ScriptBlock {Get-Process}
$ourOutput
$ourOutput | Get-Member

$ourOutput.ChildJobs[0] [ Get-Member]
```