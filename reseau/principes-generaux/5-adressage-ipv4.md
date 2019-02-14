<!-- TITLE: Adressage IPv4 -->
<!-- SUBTITLE: A quick summary of Adressage IPv4 -->

# Adresses IPv4 et classes d'adresses
Chaque ordinateur connectéà un réseau est identifié par un numéro unique. Ce N° est appelé **adresse IP**. Jusqu'à la version 4 du protocole IP, elle est codée sur 32 bits, ce qui fait donc 4 octets.
On peut donc théoriquement attribuer simultanément $$4 294 967 296$$ (soit $$2^32$$) d'adresses. En pratique, un certain nombre ne sont pas utilisables.

Une adresse IP est notée comme une suite de 4 octets, codés en décimal, séparés par des points.
Par exemple 192.168.1.41 est une adresse IP utilisant la notation décimale pointée.
Le codage décimal de chacun des 4 octets est basé sur le principe suivant:
Dans un octet (8 bits), chaque bit a un poids (importance) particulier.

| $$2^7$$ | $$2^6$$ | $$2^5$$ | $$2^4$$ | $$2^3$$ | $$2^2$$ | $$2^1$$ | $$2^0$$ | Total      |
| ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ---------- |
| 128     | 64      | 32      | 16      | 8       | 4       | 2       | 1       | de 0 à 255 |

Le bit le plus à droite est dit "bit de poids faible","LSB" et peut prendre la valeur 0 ou $$2^0 = 1$$, celui le plus à gauche est dit "bit de poids fort","MSB" et peut prendre la valeur 0 ou $$2^7 = 128$$.

La valeur de l'octet est donc la **somme des poids de chaque bit à "1"** et elle peut varier de 0 à 255.
Une adresse IP se divise en deux parties (en prenant l'adresse complète 192.168.1.41):
- d'une partie qui indique le numéro de réseau, ici 192.168.1,
- d'une autre partie qui indique le numéro de l'hôte (ou de la machine) sur ce réseau, ici 41.

Depuis 1998, c'est l'ICANN (*Internet Corporation for Assigned Names and Numbers*, remplaçant l'IANA, *Internet Assigned Numbers Agencey) qui est chargée d'attribuer des adresses **IP publiques**, c'est à dire les adresses IP des ordinateurs directement connectés sur le réseau public Internet. L'ICANN délègue une partie de la gestion des adresses à d'autres organismes appelés RIR (Regional Internet Registries).
L'affectation des **adresses Privées** est à la charge des administrateurs réseaux de l'entreprise.

L'objectif de l'adressage IP est de pouvoir identifier des réseaux mais aussi les machines appartenant à ces réseaux. Pour cela, on a défini différentes combinaisons des 32 bits. Il s'agit des classes d'adressage. Elles sont au nombre de 5: A, B, C, D et E.

Chaque classe d'adresses (A,B et C) possède une plage d'adresse réservée aux réseaux locaux privés (RFC 1918). Toute organisation peut donc utiliser ces adresses pour ses propres besoins.
> Ces adresses privées ne sont pas routées (ou routables) sur Internet.

C'est à dire que les routeurs qui gèrent l'acheminement des trames ne savent pas traiter les adresses privées ce qui est normal puisque deux ou plusieurs organisations peuvent utiliser les mêmes adresses privées. Un routeur ne peut donc savoir à qui correspond une adresse privée.

| Classe | Adresses IPv4 sur 32 bits                                                                                                                                                                       | Description                                                                                                                                                                                                                          |
|--------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A      | De <span style="color:red">0</span>0000000 . 00000000 . 00000000 . 00000001<br />A <span style="color:red">0</span>1111111 . 11111111 . 11111111 . 11111110<br />De 0.0.0.1 à 126.255.255.254   | 1 bit Id_classe<br />7 bits Id_réseau<br />24 bits Id_machine<br />126 ($$2^7$$) adresses réseau<br />16 777 214 ($$2^24 - 2$$) adresses machines<br />réseaux locaux: 10.0.0.0 à 10.255.255.255                                     |
| B      | De <span style="color:red">10</span>000000 . 00000000 . 00000000 . 00000001<br />A <span style="color:red">10</span>111111 . 11111111 . 11111111 . 11111110<br />De 128.0.0.1 à 191.255.255.254 | 2 bits Id_classe<br />14 bits Id_réseau<br />16 bits Id_machine<br />16 384 ($$2^14$$) adresses réseau<br />65 534 ($$2^16 - 2$$) adresses machines<br />réseaux locaux: 172.16.0.0 à 172.31.255.255                                 |
| C      | De <span style="color:red">110</span>00000 . 00000000 . 00000000 . 00000001<br />A <span style="color:red">110</span>11111 . 11111111 . 11111111 . 11111110<br />De 192.0.0.1 à 223.255.255.254 | 3 bits Id_classe<br />21 bits Id_réseau<br />8 bits Id_machine<br />2 097 152 ($$2^21$$) adresses réseau<br />254 ($$2^8 - 2$$) adresses machines<br />réseaux locaux: 192.168.0.0 à 192.168.255.255                                 |
| D      | De 224.0.0.0 à 239.255.255.255                                                                                                                                                                  | 4 bits Id_classe<br />28 bits Id_réseau<br />De 224.0.0.0 à 239.255.255.255<br />Adresses réservées<br />Adresses **MULTICAST** (adressage simultané de plusieurs machines utilisant une zone spéciale de l'en-tête d'un paquet IP). |
| E      | De 240.0.0.0 à 255.255.255.255                                                                                                                                                                  | 4 bits Id_classe<br />28 bits Id_réseau<br />De 240.0.0.0 à 255.255.255.255<br />Adresses **INUTILISEES**                                                                                                                            |
