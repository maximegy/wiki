<!-- TITLE: Python - Scripts -->
<!-- SUBTITLE: A quick summary of Scripts -->

# Comparaisons
## if, then, else, elseif
	

## Comparaison Booléennes
### Portes Logiques

| Porte | Explication                                                                                                   |
| ----- | ------------------------------------------------------------------------------------------------------------- |
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

# Boucles
## While





# CodeCombat
def inAttackRange(enemy):
	distance = hero.distanceTo(enemy)
	if distance <= 3:
		blabla
	else:
		blabla
		
canAttack = inAttackRange(target)

enemy = hero.findNearestEnemy()
if enemy.type == "munchkin":
	hero.attack(enemy)

while True:
	item = hero.findNearestItem()
	if item:
		itemPosition = item.pos
		itemX = itemPosition.x
		itemY = itemPosition.y
		hero.moveXY(itemX, itemY)






