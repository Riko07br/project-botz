class_name Item
extends Area3D

func _ready() -> void:
	body_entered.connect(_OnBodyEntered)
	pass

func _OnBodyEntered(body: Node3D) -> void:
	if body is PlayerController:
		print("Item picked up by player!")
		queue_free()
	pass