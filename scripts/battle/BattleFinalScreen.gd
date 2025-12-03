extends Control

@export var textLabel: RichTextLabel
@export var backToWorldButton: Button
@export var quitButton: Button


func _OnBattleStateChanged(newState: BattleManager.BattleState):
	visible = newState != BattleManager.BattleState.IN_PROGRESS

	match newState:
		BattleManager.BattleState.PLAYER_WON:
			textLabel.text = "[center][color=green]You Win![/color][/center]"
		BattleManager.BattleState.ENEMIES_WON:
			textLabel.text = "[center][color=red]You Lose![/color][/center]"
		BattleManager.BattleState.IN_PROGRESS:
			textLabel.text = ""
	pass

func _ready() -> void:
	backToWorldButton.pressed.connect(func() -> void:
		BattleManagerInstance.ChangeState(BattleManager.BattleState.IN_PROGRESS)
		get_tree().change_scene_to_file.call_deferred("res://levels/overworld.tscn")
		pass
	)
	quitButton.pressed.connect(func() -> void:
		get_tree().quit()
		pass
	)
	_OnBattleStateChanged(BattleManager.BattleState.IN_PROGRESS)
	BattleManagerInstance.BattleStateChanged.connect(_OnBattleStateChanged)
