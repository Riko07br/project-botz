class_name Enemy
extends Node

@onready var health: Health = $Health

func _ready() -> void:
	BattleManagerInstance.RegisterEnemy(self)
	health.HealthChanged.connect(_OnHealthChanged)
	pass


func _OnHealthChanged() -> void:
	if health.currentHealthPoints <= 0:
		BattleManagerInstance.UnregisterEnemy(self)
	pass