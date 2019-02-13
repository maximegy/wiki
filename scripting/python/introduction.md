<!-- TITLE: Python - Introduction -->
<!-- SUBTITLE: A quick summary of Introduction -->

# Présentation
Python est un langage de programmation facile à apprendre et puissant. C'est un langage orienté objet et multiplateformes.
Il se distingue par la lisibilité et la simplicité du code. Il permet de créer des scripts pour exécuter des tâches.
On peut, par exemple, l'utiliser pour créer des interfaces graphiques.

# Installation
## Unix
### Mac
Via le terminal, lancer la commande: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`.
HomeBrew est un gestionnaire de packet comme `yum` ou `apt` respectivements sur Red Hat / CentOS et Linux.

Une fois Homebrew installé, installer Python via la commande `brew install python`.
Il faut savoir qu'OS 10 contient déjà Python 2.7 et que Homebrew installe la version 3.

### Linux
#### Ubuntu, Debian
`sudo apt install python3`

#### Fedora, Red-Hat, CentOS
`sudo yum install python3`

#### Arch
`sudo pacman -S python3`

Pour connaitre la version de Python, lancer la commande `python --version` et `python3 --version`.
Pour lancer l'interpreteur, lancer la commande `python3`.
Pour ajouter Python à la variable `PATH`, lancer la commande `export $PATH=chemin/to/python:$PATH`. Pour l'afficher, taper `echo $PATH`.

## Windows
Aller à https://www.python.org/downloads/ et télécharger la version voulue.
Lancer le programme, choisir les options d'installation:

![Install Python Windows 1](/uploads/python/install-python-windows-1.png "Install Python Windows 1"){.align-center}

Puis lancer l'installation:

![Install Python Windows 2](/uploads/python/install-python-windows-2.png "Install Python Windows 2"){.align-center}

Pour gérer la variable PATH, aller dans **Panneau de configuration\Système et sécurité\Système** puis dans **Paramètres Systèmes avancés** et enfin cliquer sur **Variables d'Environnement...**. Sélectionner la variable PATH et vérifier que les chemins vers Python y sont renseignés.

```text
C:\Users\*user*\AppData\Local\Programs\Python\Python37-32\Scripts\
C:\Users\*user*\AppData\Local\Programs\Python\Python37-32\
```
La variable `PATH` sert à Windows pour chercher la commande qu'on a tapé. Lorsque je tape `pip install`, Windows va chercher dans chacun des chemins présents dans la variable `PATH` la commande, s'il ne la trouve pas, une erreur sera affichée.


