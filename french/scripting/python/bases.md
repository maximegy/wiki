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


## Types de données

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