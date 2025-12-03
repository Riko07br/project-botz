class_name ItemSpawner
extends Node3D

@export var spawnTick: float = 2
@export var itemsToSpawn: Dictionary[PackedScene, float]
@export var spawnArea: Vector2 = Vector2.ONE
@export var spawnDistanceFromPlayer: float = 4

@onready var player: Node3D = $"../Player"

var timer: Timer
var cachedSpawnAreaHalf: Vector2

func _SpawnItem(itemToSpawn: PackedScene) -> void:
	var newPickupPosition: Vector3 = _GetRandomSpawnPosition()
	var attempts: int = 0
	while newPickupPosition.distance_to(player.global_transform.origin) < spawnDistanceFromPlayer:
		newPickupPosition = _GetRandomSpawnPosition()
		attempts += 1
		if attempts >= 5:
			print("Could not find valid spawn position for item after " + str(attempts) + " attempts.")
			return
		pass

	var newPickup: Node3D = itemToSpawn.instantiate()
	add_child(newPickup)
	newPickup.global_position = newPickupPosition + global_transform.origin
	pass

func _GetRandomSpawnPosition() -> Vector3:
	var randomPosition: Vector3 = Vector3(
		randf_range(-cachedSpawnAreaHalf.x, cachedSpawnAreaHalf.x),
		0,
		randf_range(-cachedSpawnAreaHalf.y, cachedSpawnAreaHalf.y))

	return randomPosition + global_transform.origin


func _ready() -> void:
	cachedSpawnAreaHalf = spawnArea / 2

	timer = Timer.new()
	timer.wait_time = spawnTick
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_OnSpawnTick)
	pass


func _OnSpawnTick() -> void:
	for itemToSpawn in itemsToSpawn:
		var chance: float = itemsToSpawn[itemToSpawn]
		if randf() < chance:
			_SpawnItem(itemToSpawn)