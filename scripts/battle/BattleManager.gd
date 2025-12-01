extends Node

var enemies: Array[Enemy] = []

func RegisterEnemy(enemy: Enemy) -> void:
	print("Registering enemy: " + enemy.name)
	enemies.append(enemy)
	pass