class_name ItemSpawner
extends Node3D

const SPAWN_TICK: float = 2

@export var itemScene: PackedScene
@export var spawnArea: Vector2 = Vector2.ONE

var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = SPAWN_TICK
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_OnSpawnTick)
	pass

func _OnSpawnTick() -> void:
	var newItem: Node3D = itemScene.instantiate()
	get_tree().root.add_child(newItem)
	var newItemPosition = Vector3(
		randf_range(-spawnArea.x / 2, spawnArea.x / 2),
		0,
		randf_range(-spawnArea.y / 2, spawnArea.y / 2)
	)
	newItem.global_position = newItemPosition + global_transform.origin