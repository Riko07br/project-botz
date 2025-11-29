class_name Projectile
extends ShapeCast3D

@export var moveSpeed: float = 20
@export var maxFlyingTime: float = 2

var flyingTime: float = 0
var sphereOffset: float = 0


func _ready() -> void:
	top_level = true
	enabled = true
	max_results = 1
	sphereOffset = shape.radius

func _physics_process(delta: float) -> void:
	flyingTime += delta

	if flyingTime > maxFlyingTime:
		queue_free()
		return

	var distanceToTravel: float = delta * moveSpeed
	target_position = Vector3.BACK * distanceToTravel
	force_shapecast_update()

	if is_colliding():
		queue_free()
		return

	global_transform.origin += transform.basis.z * distanceToTravel
