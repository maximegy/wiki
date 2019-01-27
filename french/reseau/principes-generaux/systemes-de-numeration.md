<!-- TITLE: Systemes De Numeration -->
<!-- SUBTITLE: A quick summary of Systemes De Numeration -->

# Introduction
L'ordinateur travaille seulement avec un langage binaire. Ce langage ne comprend que deux symboles: **0** et **1**. Cette raison est historique et technologique puisque les composants éléctroniques ne peuvent avoir que deux états: soit le courant passe (état 1) ou il ne passe pas (état 0).
Le binaire repose donc sur la base 2, pour 2 symboles. L'écriture d'un nombre binaire se fait de la manière suivante : n<SUB>2</SUB>

# Vocabulaire
* Un **bit** (pour Binary digiT - digit binaire) est un élément binaire pouvant prendre la valeur 0 ou 1,
* Un **quartet** est une suite de 4 bits,
* Un **octet** est une suite de 8 bits.

En anglais octet se traduit par **byte**. Il est donc nécessaire de ne pas confondre bit et byte. 1Ko = 1KB.

| Mesure             | Correspondance                                  |
| ------------------ | ----------------------------------------------- |
| 1 Ko (Kilo octets) | 10<SUP>3</SUP> octets - 1 000 bits              |
| 1 Mo (Mega octets) | 10<SUP>6</SUP> octets - 1 000 000 bits          |
| 1 Go (Giga octets) | 10<SUP>9</SUP> octets - 1 000 000 000 bits      |
| 1 To (Kilo octets) | 10<SUP>12</SUP> octets - 1 000 000 000 000 bits |

# Conversions
## Décimal vers binaire par divisions successives
![Decimal To Binaire Division](/uploads/systemes-de-numerations/decimal-to-binaire-division.png "Decimal To Binaire Division")
Le principe est de diviser un nombre en base 10 par 2. Tant que le **quotient** de chaque division n'est pas égal à **0**, on le divise par 2.
Le résultat de la conversion est obtenu par la lecture du reste des divisions en partant de la dernière division jusqu'à la première.

## Décimal vers binaire par soustractions successives
Le principe est de soustraire les puissances de 2 de la plus grande possible à la plus petite. Si on peut soustraire la puissance au nombre décimal, on note un **1** sinon **0**.
Pour rappel :
<table width=auto align=center border="1">
    <tr>
        <td>Puissance de 2</td>
        <td>2<SUP>7</SUP></td>
        <td>2<SUP>6</SUP></td>
        <td>2<SUP>5</SUP></td>
        <td>2<SUP>4</SUP></td>
        <td>2<SUP>3</SUP></td>
        <td>2<SUP>2</SUP></td>
        <td>2<SUP>1</SUP></td>
        <td>2<SUP>0</SUP></td>
    </tr>
    <tr>
        <td>Valeur Décimale</td>
        <td>128</td>
        <td>64</td>
        <td>32</td>
        <td>16</td>
        <td>8</td>
        <td>4</td>
        <td>2</td>
        <td>1</td>
    </tr>
</table>
Un exemple : convertir 230<SUB>10</SUB> en base 2:

<table border="0" align=center>
    <tr><td>De</td><td>230</td><td>on peut retirer</td><td>128 (2<SUP>7</SUP></td><td>reste</td><td>102</td><td>==></td><td>1</td><tr>
    <tr><td>De</td><td>102</td><td>on peut retirer</td><td>64 (2<SUP>6</SUP>)</td><td>reste</td><td>38</td><td>==></td><td>1</td></tr>
    <tr><td>De</td><td>38</td><td>on peut retirer</td><td>32 (2<SUP>5</SUP>)</td><td>reste</td><td>6</td><td>==></td><td>1</td></tr>
    <tr><td>De</td><td>6</td><td>on ne peut pas retirer</td><td>16 (2<SUP>4</SUP>)</td><td>reste</td><td>6</td><td>==></td><td>0</td></tr>
    <tr><td>De</td><td>6</td><td>on ne peut pas retirer</td><td>8 (2<SUP>3</SUP>)</td><td>reste</td><td>6</td><td>==></td><td>0</td></tr>
    <tr><td>De</td><td>6</td><td>on peut retirer</td><td>4 (2<SUP>2</SUP>)</td><td>reste</td><td>2</td><td>==></td><td>1</td></tr>
    <tr><td>De</td><td>2</td><td>on peut retirer</td><td>2 (2<SUP>1</SUP>)</td><td>reste</td><td>0</td><td>==></td><td>1</td></tr>
    <tr><td>De</td><td>0</td><td>on ne peut pas retirer</td><td>1 (2<SUP>0</SUP>)</td><td>reste</td><td>0</td><td>==></td><td>0</td></tr>
</table>

Le résultat est 230<SUB>10</SUB> => 11100110<SUB>2</SUB>

## Binaire vers Décimal
Chaque bit d'un octet n'a pas le même poids. Le bit le plus à droite est le `LSB` (*Least Significant Bit* - *bit de poids faible*), il peut prendre la valeur **0** ou **2<SUP>0</SUP>=1**.
A l'inverse, le bit le plus à gauche est le `MSB` (*Most Significant Bit* - *bit de poids fort*), il peut prendre la valeur **0** ou **2<SUP>7</SUP>=128**.

Pour faire la conversion de binaire à décimal, on va donc multiplier la valeur du bit (0 ou 1) par son *poids binaire*, puis on effectue la somme des résultats obtenus.
exemple: 110011<SUB>2</SUB> à convertir en décimal.
<table border="0" align="center">
    <tr><td>1</td><td></td><td>1</td><td></td><td>0</td><td></td><td>0</td><td></td><td>1</td><td></td><td>1</td></tr>
    <tr><td>*</td><td></td><td>*</td><td></td><td>*</td><td></td><td>*</td><td></td><td>*</td><td></td><td>*</td></tr>
    <tr><td>2<SUP>5</SUP></td><td></td><td>2<SUP>4</SUP></td><td></td><td>2<SUP>3</SUP></td><td></td><td>2<SUP>2</SUP></td><td></td><td>2<SUP>1</SUP></td><td></td><td>2<SUP>0</SUP></td></tr>
    <tr><td>(32)</td><td></td><td>(16)</td><td></td><td>(8)</td><td></td><td>(4)</td><td></td><td>(2)</td><td></td><td>(1)</td></tr>
    <tr><td>=</td><td></td><td>=</td><td></td><td>=</td><td></td><td>=</td><td></td><td>=</td><td></td><td>=</td></tr>
    <tr><td>32</td><td>+</td><td>16</td><td>+</td><td>0</td><td>+</td><td>0</td><td>+</td><td>2</td><td>+</td><td>1</td></tr>
</table>
Donc 110011<SUB>2</SUB> => 51<SUB>10</SUB>
