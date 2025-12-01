class_name Pickup
extends Area3D

func Pickup(playerController: PlayerController) -> void:
	print("Item picked up by player! " + playerController.name)
	queue_free()
	pass

func _ready() -> void:
	body_entered.connect(_OnBodyEntered)
	pass

func _OnBodyEntered(body: Node3D) -> void:
	if body is PlayerController:
		Pickup(body as PlayerController)
	pass