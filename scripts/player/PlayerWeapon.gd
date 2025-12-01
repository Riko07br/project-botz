class_name PlayerWeapon
extends Node

@export var damage: int = 5

func Attack() -> void:
	var enemies: Array[Enemy] = BattleManagerInstance.enemies
	var enemyIndex: int = randi_range(0, enemies.size() - 1) if enemies.size() > 0 else -1

	var enemyHeath: Health = enemies[enemyIndex].get_node("Health") as Health
	enemyHeath.TakeDamage(damage)
	pass
