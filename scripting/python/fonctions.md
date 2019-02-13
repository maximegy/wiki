<!-- TITLE: Python - Fonctions -->
<!-- SUBTITLE: A quick summary of Fonctions -->

# Concept
Une fonction est un concept important lors de l'écriture de scripts. Il permet de séparer les parties individuelles, répétitives du code.


Une fonction est définie de la manière suivante :

```python
def masuperfonction() :
  *some code*
```

Pour utiliser la fonction il suffit de l'appeler par son nom :

```python
masuperfonction()
```

# Paramètres
Souvent les fonctions nécessitent un argument afin de modifier l'action répétitive tout en optimisant et réduisant la longueur de son code.
Le paramètre est renseigné entre `(`et `)` quand on appelle la fonction.
Le paramètre est donc un argument appelé dans la définition de la fonction.

Cette fonction a un paramètre "var2"
```python
def mabellefonction(var2):
  if(var2):
    some code
		
var1 = somecomande

mabellefonction(var1)
```
Ci-dessus, `var1` est l'argument, il devient `var2` dans `mabellefonction`


