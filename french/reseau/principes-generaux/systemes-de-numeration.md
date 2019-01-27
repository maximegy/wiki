<!-- TITLE: Systemes De Numeration -->
<!-- SUBTITLE: A quick summary of Systemes De Numeration -->

# Introduction
L'ordinateur travaille seulement avec un langage binaire. Ce langage ne comprend que deux symboles: **0** et **1**.
Cette raison est historique et technologique puisque les composants éléctroniques ne peuvent avoir que deux états: soit le courant passe (état 1) ou il ne passe pas (état 0).
Le binaire repose donc sur la base 2, pour 2 symboles. L'écriture d'un nombre binaire se fait de la manière suivante : $$n_2$$


# Vocabulaire
* Un **bit** (pour Binary digiT - digit binaire) est un élément binaire pouvant prendre la valeur 0 ou 1,
* Un **quartet** est une suite de 4 bits,
* Un **octet** est une suite de 8 bits.

En anglais, octet se traduit par **byte**. Il est donc nécessaire de ne pas confondre **bit** et **byte**. 1Ko = 1KB.

|       Mesure       | Correspondance                            |
| :----------------: | :---------------------------------------- |
| 1 Ko (Kilo octets) | $$10^3$$ octets - 1 000 bits              |
| 1 Mo (Mega octets) | $$10^6$$ octets - 1 000 000 bits          |
| 1 Go (Giga octets) | $$10^9$$ octets - 1 000 000 000 bits      |
| 1 To (Kilo octets) | $$10^12$$ octets - 1 000 000 000 000 bits |


# Conversions
## Binaires
### Décimal vers binaire par divisions successives
![Decimal To Binaire Division](/uploads/systemes-de-numerations/decimal-to-binaire-division.png "Decimal To Binaire Division")
Le principe est de diviser un nombre en base 10 par 2. Tant que le **quotient** de chaque division n'est pas égal à **0**, on le divise par 2.
Le résultat de la conversion est obtenu par la lecture du reste des divisions en partant de la dernière division jusqu'à la première.

### Décimal vers binaire par soustractions successives
Le principe est de soustraire les puissances de 2 de la plus grande possible à la plus petite. Si on peut soustraire la puissance au nombre décimal, on note un **1** sinon **0**.
Pour rappel :
| Puissance de 2  | $$2^7$$ | $$2^6$$ | $$2^5$$ | $$2^4$$ | $$2^3$$ | $$2^2$$ | $$2^1$$ | $$2^0$$ |
| --------------- | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
| Valeur décimale |   128   |   64    |   32    |   16    |    8    |    4    |    2    |    1    |

Un exemple : convertir $$230_10$$ en base 2:
- De 230 on peut retirer 128 ($$2^7$$) reste 102 ==> 1
- De 102 on peut retirer 64 ($$2^6$$) reste 38 ==> 1
- De 38 on peut retirer 32 ($$2^5$$) reste 6 ==> 1
- De 6 on ne peut pas retirer 16 ($$2^4$$) reste 6 ==> 0
- De 6 on ne peut pas retirer 8 ($$2^3$$) reste 6 ==> 0 
- De 6 on peut retirer 4 ($$2^2$$) reste 2 ==> 1
- De 2 on peut retirer 2 ($$2^1$$) reste 0 ==> 1
- De 0 on ne peut pas retirer 1 ($$2^0$$) reste 0 ==> 0

Le résultat est $$230_10$$ => $$11100110_2$$.


### Binaire vers Décimal
Chaque bit d'un octet n'a pas le même poids. Le bit le plus à droite est le **LSB** (*Least Significant Bit* - *bit de poids faible*), il peut prendre la valeur **0** ou **$$2^0$$=1**.
A l'inverse, le bit le plus à gauche est le **MSB** (*Most Significant Bit* - *bit de poids fort*), il peut prendre la valeur **0** ou **$$2^7$$=128**.

Pour faire la conversion de binaire à décimal, on va donc multiplier la valeur du bit (0 ou 1) par son *poids binaire*, puis on effectue la somme des résultats obtenus.

exemple: $$110011_2$$ à convertir en décimal.
* 1 * $$2^5$$ (32) = 32
* 1 * $$2^4$$ (16) = 16
* 0 * $$2^3$$ (8)  = 0
* 0 * $$2^2$$ (4)  = 0
* 1 * $$2^1$$ (2)  = 2
* 1 * $$2^0$$ (1)  = 1

Donc $$110011_2$$ => $$51_10$$.

## Hexadécimales
Lorsque qu'il s'agit de grandes séries binaires, ce langage devient très difficile à traiter par l'Homme. Le système d'hexadécimal (base 16) est donc utilisé.
L'hexadécimal est donc un alphabet de 16 symboles:
| Base 16 | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | A   | B   | C   | D   | E   | F   |
| ------- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| Base 10 | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  | 13  | 14  | 15  |


### Hexadécimal vers Décimal
Cette conversion repose sur le même principe que la conversion binaire vers décimal sauf qu'on utilise les puissances de 16.
Les poids sont par exemple: $$16^0$$=1, $$16^1$$=16, $$16^2$$=256, $$16^3$$=4096.
Exemple: convertir $$13D_16$$ en base 10
    > $$1*16^{2}$$





## Opérateurs Logiques

### Portes Logiques

| Porte | Explication                                                                                                   |
| :---: | ------------------------------------------------------------------------------------------------------------- |
| AND   | ET : le résultat de l'opération prend la valeur `true` si les deux valeurs sont `true`                        |
| OR    | OU : le résultat de l'opération prend la valeur `true` si au moins une des deux valeurs est `true`            |
| XOR   | Ou Exclusif : le résultat de l'opération prend la valeur true si eclusivement une des deux valeurs est `true` |

### Tables de Vérités
Une table de vérité est une table mathématique utilisée en logique, en particulier pour  l'algèbre de Boole, pour représenter des expressions logiques.
Une table de vérité est composée d'une colonne pour chaque variable imputée (A et B par exemple) et d'une colonne où sont inscrits tous les résultats possibles de l'opération logique présentée.

#### Table de vérité ET

   | A   | B   | A ET B |
   | --- | --- | ------ |
   | 0   | 0   | 0      |
   | 0   | 1   | 0      |
   | 1   | 0   | 0      |
   | 1   | 1   | 1      |


#### Table de vérité OU
	 
| A   | B   | A OU B |
| --- | --- | ------ |
| 0   | 0   | 0      |
| 0   | 1   | 1      |
| 1   | 0   | 1      |
| 1   | 1   | 1      |

#### Table de vérité XOR

| A   | B   | A XOR B |
| --- | --- | ------- |
| 0   | 0   | 0       |
| 0   | 1   | 1       |
| 1   | 0   | 1       |
| 1   | 1   | 0       |
