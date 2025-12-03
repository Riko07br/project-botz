class_name Pickup
extends Area3D

@export var expireTime: float = 5

var elapsedTime: float = 0

func Pickup(playerController: PlayerController) -> void:
	print("Item picked up by player! " + playerController.name)
	queue_free.call_deferred()
	pass

func _ready() -> void:
	body_entered.connect(_OnBodyEntered)
	pass

func _process(delta: float) -> void:
	elapsedTime += delta
	if elapsedTime >= expireTime:
		queue_free()
	pass


func _OnBodyEntered(body: Node3D) -> void:
	if body is PlayerController:
		Pickup(body as PlayerController)
	pass