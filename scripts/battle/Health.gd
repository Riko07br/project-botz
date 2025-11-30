class_name Health
extends Node

@export var maxHealthPoints: int = 10

var currentHealthPoints: int

signal HealthChanged()

func TakeDamage(damage: int) -> void:
	currentHealthPoints -= damage
	if currentHealthPoints <= 0:
		currentHealthPoints = 0
	HealthChanged.emit()
	pass

func _ready() -> void:
	currentHealthPoints = maxHealthPoints
	pass