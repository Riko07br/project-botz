extends Control

@export var textLabel: RichTextLabel


func _OnBattleStateChanged(newState: BattleManager.BattleState):
	match newState:
		BattleManager.BattleState.PLAYER_WON:
			textLabel.text = "[center][color=green]You Win![/color][/center]"
		BattleManager.BattleState.ENEMIES_WON:
			textLabel.text = "[center][color=red]You Lose![/color][/center]"
		_:
			textLabel.text = ""
	pass

func _ready() -> void:
	_OnBattleStateChanged(BattleManager.BattleState.IN_PROGRESS)
	BattleManagerInstance.BattleStateChanged.connect(_OnBattleStateChanged)
