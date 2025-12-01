class_name Enemy
extends Node

func _ready() -> void:
	BattleManagerInstance.RegisterEnemy(self)
	pass