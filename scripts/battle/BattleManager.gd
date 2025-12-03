class_name BattleManager
extends Node

var enemies: Array[Enemy] = []
var state: BattleState = BattleState.IN_PROGRESS

signal BattleStateChanged(newState: BattleState)

enum BattleState {
	IN_PROGRESS,
	PLAYER_WON,
	ENEMIES_WON
}

func RegisterEnemy(enemy: Enemy) -> void:
	print("Registering enemy: " + enemy.name)
	enemies.append(enemy)
	pass

func UnregisterEnemy(enemy: Enemy) -> void:
	print("Unregistering enemy: " + enemy.name)
	enemies.erase(enemy)
	if enemies.size() == 0:
		ChangeState(BattleState.PLAYER_WON)
	pass

func ClearEnemies() -> void:
	print("Clearing all enemies")
	enemies.clear()
	pass

func ChangeState(newState: BattleState) -> void:
	state = newState

	get_tree().paused = state != BattleState.IN_PROGRESS

	BattleStateChanged.emit(state)
	pass

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_battle") and state != BattleState.ENEMIES_WON:
		get_tree().paused = not get_tree().paused
	pass