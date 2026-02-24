extends Control

func _ready() -> void:
	#visible = true
	GameManager.state_changed.connect(_on_state_changed)
	
	_on_state_changed(GameManager.current_state)

func _on_state_changed(state) -> void:
	if state == GameManager.GameState.MENU:
		visible = true
	else:
		visible = false
	
func _on_btn_start_pressed() -> void:
	GameManager.start_game()
