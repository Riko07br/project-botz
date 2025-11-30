class_name Hittable
extends CollisionShape3D

@export var isWeakPoint: bool = false

signal Hitted(hitData: HitData)


func Hit(hitData: HitData) -> void:
	Hitted.emit(hitData)
	pass


class HitData:
	var damage: int

	func _init(_damage: int) -> void:
		damage = _damage
		pass

	func _to_string() -> String:
		return "damage: %d\n" % [damage]