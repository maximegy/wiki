Voir les connexions au serveur
```SQL
SELECT * FROM v$session;
```

Selectionner les USERS
```SQL
SELECT * FROM v$session WHERE TYPE = 'USER';
```

```SQL
SELECT sid, serial#, username, status, osuser, machine, program, logon_time
FROM v$session
WHERE TYPE = 'USER'
AND osuser IS NOT null;
```

Kill la session de toto
```SQL
ALTER SYSTEM KILL SESSION '269,781' IMMEDIATE;
```
269 = sid 781 = serial#

Générer une requête à partir de la requête
```SQL
SELECT 'alter system kill session '''sid||','||serial#||''' immediate;'
FROM v$session
WHERE TYPE = 'USER'
AND osuser IS NOT null
AND username = 'TOTO';
```
