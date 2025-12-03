class_name PlayerController
extends CharacterBody3D

@export var goToLastPositionOnStart: bool = true

@export var movementSpeed: float = 6
@export_range(.4, 1) var speedDamp: float = .85
@export_range(.4, 1) var noInputSpeedDamp: float = .9


func GetMovementDirection():
	var inputDir: Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var speedDelta: float = speedDamp if inputDir != Vector2.ZERO else noInputSpeedDamp
	speedDelta = movementSpeed * (1 - speedDelta)

	var inputWithVelocity = Vector3(inputDir.x, 0, inputDir.y).normalized() * movementSpeed

	var planeVelocity: Vector3 = velocity
	planeVelocity.y = 0
	planeVelocity = planeVelocity.move_toward(inputWithVelocity, speedDelta);

	return planeVelocity

func _ready() -> void:
	if goToLastPositionOnStart and GameManagerInstance.lastPlayerPosition != null:
		global_position = GameManagerInstance.lastPlayerPosition
	pass

func _physics_process(_delta: float) -> void:
	var newDirection = GetMovementDirection()

	var currentVelocity: Vector3 = velocity
	currentVelocity.x = newDirection.x;
	currentVelocity.z = newDirection.z;

	velocity = currentVelocity
	move_and_slide()
	pass
