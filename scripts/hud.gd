extends CanvasLayer

@export var lbl_score: Label

func _ready() -> void:
	visible = false
	GameManager.state_changed.connect(_on_state_changed)
	_on_state_changed(GameManager.current_state)
	
func _process(_delta: float) -> void:
	lbl_score.text = "Score: " + str(GameManager.game_time)

func _on_state_changed(state) -> void:
	if state == GameManager.GameState.PLAYING:
		visible = true
	else:
		visible = false
	
func _on_btn_retry_pressed() -> void:
	GameManager.start_game()
