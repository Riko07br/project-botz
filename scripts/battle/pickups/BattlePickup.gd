class_name BattlePickup
extends Pickup

func Pickup(playerController: PlayerController) -> void:
	GameManagerInstance.lastPlayerPosition = playerController.global_position
	get_tree().change_scene_to_file.call_deferred("res://levels/battle_basic.tscn")
	pass