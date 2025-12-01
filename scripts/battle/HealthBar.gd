extends Node3D

@export var health: Health


func _ready() -> void:
	health.HealthChanged.connect(_OnHealthChanged)
	_OnHealthChanged.call_deferred()
	pass

func _OnHealthChanged() -> void:
	var currentHealth: float = health.currentHealthPoints
	var maxHealth: float = health.maxHealthPoints
	scale.x = currentHealth / maxHealth