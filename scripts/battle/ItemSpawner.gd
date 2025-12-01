class_name ItemSpawner
extends Node3D

const SPAWN_TICK: float = 2

@export var itemScene: PackedScene
@export var pickups: Dictionary[PackedScene, float]
@export var spawnArea: Vector2 = Vector2.ONE

var timer: Timer


func _SpawnItem(itemToSpawn: PackedScene) -> void:
	var newPickup: Node3D = itemToSpawn.instantiate()
	get_tree().root.add_child(newPickup)
	var newPickupPosition = Vector3(
		randf_range(-spawnArea.x / 2, spawnArea.x / 2),
		0,
		randf_range(-spawnArea.y / 2, spawnArea.y / 2)
	)
	newPickup.global_position = newPickupPosition + global_transform.origin
	pass

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = SPAWN_TICK
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_OnSpawnTick)
	pass

func _OnSpawnTick() -> void:
	for itemToSpawn in pickups:
		var chance: float = pickups[itemToSpawn]
		if randf() < chance:
			_SpawnItem(itemToSpawn)