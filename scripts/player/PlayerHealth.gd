class_name PlayerHealth
extends Health

@export var hittable: Hittable

func _ready() -> void:
	super._ready()
	if hittable:
		hittable.Hitted.connect(_OnHitted)
	pass

func _OnHitted(hitData: Hittable.HitData) -> void:
	TakeDamage(hitData.damage)
	pass