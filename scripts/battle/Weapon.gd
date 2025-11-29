class_name Weapon
extends Node3D

@export_group("Rotation")
## If null, rotates self
@export var rotationTarget: Node3D
@export var rotateSpeed: float = 5.0
@export var minAngle: float = -45.0
@export var maxAngle: float = 45.0

@export_group("Firing")
@export var fireRate: float = 1.0
@export var projectile: PackedScene
## Keep null to use self
@export var spawnPoint: Node3D

var timer: float = 0.0
var shotsTime: float = 0.0
var rotationDirection: float = 1.0

func RotateBackAndForth(delta: float) -> void:
	rotationTarget.rotation_degrees.y += rotateSpeed * rotationDirection * delta

	if rotationTarget.rotation_degrees.y >= maxAngle:
		rotationDirection = -1.0
	elif rotationTarget.rotation_degrees.y <= minAngle:
		rotationDirection = 1.0

func ShootProjectile(delta: float) -> void:
	timer += delta
	if timer <= shotsTime:
		return
	timer = 0

	var newProjectile: Node3D = projectile.instantiate()

	get_tree().root.add_child(newProjectile)
	newProjectile.global_position = spawnPoint.global_position
	newProjectile.global_rotation = spawnPoint.global_rotation
	pass

func _ready() -> void:
	shotsTime = 1.0 / fireRate
	if rotationTarget == null:
		rotationTarget = self

	if spawnPoint == null:
		spawnPoint = self
	pass

func _process(delta: float) -> void:
	ShootProjectile(delta)
	RotateBackAndForth(delta)
	pass
