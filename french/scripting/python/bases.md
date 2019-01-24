<!-- TITLE: Python - Bases -->
<!-- SUBTITLE: Bases de Python -->

# L'interpréteur de commandes
Au lancement de l'interpréteur, les 3 chevrons (`>>>`), signifient que l'interpréteur est prêt à recevoir des instructions.

![Python Interpreteur](/uploads/python/python-interpreteur.png "Python Interpreteur"){.align-center}

# Variables
## Introduction
Une variable est une donnée du programme, stockée dans l'ordinateur. C'est un code que nous pouvons lier à une donnée du programme afin de pouvoir l'utiliser à plusieurs reprises mais aussi intéragir avec.
L'utilisation est simple, c'est l'équivalent de dire "je veux que dans une variable que je nomme `bonjour` , tu stockes "`hello`"  pour que je puisse le réutiliser plus tard".

## Affectation

En Python, pour affecter une valeur à une variable il suffit d'écrire : `nom_de_variable = valeur` - `bonjour = "hello"`.
Attention toutefois, des règles de syntaxe d'appliquent :
* Le nom de la variable ne peut pas commencer par un chiffre [0 à 9],
* Le nom de la variable peut être composé de lettres (majuscules et minuscules), chiffres et du symbole `_` (souligné ou underscore en anglais).
* Python est sensible à la casse, donc bonjour, Bonjour, BONjour et BoNjOuR sont des variables différentes.
* Il existe des mots réservés qui sont utilisés par Python :

|and|del|from|none|true|as|
|---|---|----|----|----|--|
|elif|global|nonllocal|try|assert|else|
|if|not|while|break|except|import|
|or|with|class|false|in|pass|
|yield|continue|finally|is|raise|def|
|for|lambda|return||||

Il existe des conventions entre développeurs sur l'écriture des variables :
- La première consiste à remplacer les espaces par des "`_`", par exemple `ma_variable`,
- La seconde consiste à passer la première lettre de chaque mots en majuscule, par exemple `maSuperbeVariable`.


# Types de données
Le typage est dynamique en python. Le type n'est donc pas précisé explicitement, il est dédui

## Types immuables (ou immutable)
Un objet immuable est un objet dont l'état ne peut pas être modifié après sa création. Contrasté avec l'objet variable.
Une opération sur un objet de ce type va donc créer une autre variable temporaire du même type pour stocker le résultat avant de l'affecter à l'objet initial.
Par exemple :

```python
a = 2
# Opération
a = a + 3
# Création de la variable temporaire (virtuellement)
c = 2 + 3
c = 5
# Attribution de la nouvelle valeur à a
a = c
a = 5
```


### Nombres
#### Entiers
Les nombres entiers, `int`, sont des nombres entiers positifs ou nuls, c'est-à-dire qu'il s'écrivent sans chiffre après la virgule et est supérieur ou égal à 0.

```python
>>> x = 8
>>> print ("x = ", x, type(x))
x =  8 <class 'int'>
```


#### Réels
Les nombres réels, `float`, sont des nombres qui peuvent être représentés par une partie entière et une liste finie ou infinie de décimales.

```python
>>> x = 8.3
>>> print ("x = ", x, type(x))
x =  8.3 <class 'float'>
```

#### Opérateurs

| Opérateur | Signification | Exemple |
|-------------|---------------|----------|
| `<<` ou `>>` | décalage de bit à gauche ou à droite, bitwise shift | `x = 8 << 1` |
| `|` | opérateur logique `ou` | `x = 8 | 1` |
| `&` | opérateur logique `et` | `x = 8 & 1` |
| `+` ou `-` | addition ou soustraction| `x = a + b` - `x = a - b` |
| `+=` ou `-=` | opération puis affectation | `x +=3` - `x -= 3` |
| `*` ou `/` | multiplication ou division | `x = a * b` - `x = a / b` |
| `*=` ou `/=` | opération puis affectation | `x +=3` - `x -= 3` |
| `//` | division entière, renvoie le quotient de la division | `x = a // b` |
| `%` | reste d'une division - modulo | `x = a % b` |
| `**` | puissance, `** 0.5` pour la racine carrée | `x = a ** 4` |
| `int()` | conversion en nombre entier | `w = int(5.5)` |
| `float()` | conversion en nombre réel | `w = float(8)` |
| | on peut aussi convertir une chaîne de caractères | `w = int("5.5")` |
Attention toutefois, pour convertir une chaîne de caractère représentant un nombre réel en nombre entier, il faut d'abord la convertir en nombre réel puis en nombre entier :

```python
>>> x = int("3.4")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: invalid literal for int() with base 10: '3.4'
>>> x = int(float("3.4"))
>>> print(x)
3
```




### Booléen

### Chaînes de Caractères

### Tuple

### Nombres Complexes


### Bytes

### None
Ce type signifie qu'une variable ne contient **rien**, cette variable est donc égale à `None`.

```python
>>> s = None
>>> print(s)
None
```


## Types modifiables ou mutable

## Concaténation
On peux combiner des chaînes de caractère en une seule en utilisant l'opérateur `+`.
Exemple :

```python
commande("ma chaine" + " de caractère")
```

On peut aussi concaténer avec des variables:
```python
commande("bonjour " + "$user")
```