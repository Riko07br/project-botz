class_name AttackPickup
extends Pickup

@export var attackSide: AttackSide = AttackSide.NONE

enum AttackSide {
	NONE = 0,
	LEFT = 1,
	RIGHT = 2,
	BOTH = 3
}


func Pickup(playerController: PlayerController) -> void:
	match attackSide:
		AttackSide.LEFT:
			_AttackWithWeapon(playerController.get_node("LeftWeapon"))
		AttackSide.RIGHT:
			_AttackWithWeapon(playerController.get_node("RightWeapon"))
		AttackSide.BOTH:
			_AttackWithWeapon(playerController.get_node("LeftWeapon"))
			_AttackWithWeapon(playerController.get_node("RightWeapon"))
	queue_free()
	pass

func _AttackWithWeapon(weapon: Node) -> void:
	(weapon as PlayerWeapon).Attack()
	pass