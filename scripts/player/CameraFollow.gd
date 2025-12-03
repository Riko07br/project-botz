extends Camera3D

@export var target: Node3D
@export var smoothWeight: float = 0.1
@export var offset: Vector3

func _process(_delta: float) -> void:
	var desiredPosition: Vector3 = target.global_position + offset

	if global_position.distance_squared_to(desiredPosition) < 0.01:
		return

	var smoothPosition: Vector3 = global_position.lerp(desiredPosition, smoothWeight)
	global_position = smoothPosition
