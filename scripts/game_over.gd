extends Control

func _ready() -> void:
	visible = false
	GameManager.state_changed.connect(_on_state_changed)

func _on_state_changed(state) -> void:
	if state == GameManager.GameState.GAME_OVER:
		visible = true
	else:
		visible = false
	
func _on_btn_retry_pressed() -> void:
	GameManager.start_game()
