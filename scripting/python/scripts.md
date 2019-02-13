<!-- TITLE: Python - Scripts -->
<!-- SUBTITLE: A quick summary of Scripts -->

# Comparaisons
## if, then, else, elseif
	

## Comparaison Booléennes

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






