extends Control

@export var score_label: Label

@onready var btn_retry: Button = $V_ContainerGameOver/BtnRetry
@onready var btn_quit: Button = $V_ContainerGameOver/BtnQuit

func _ready() -> void:
	visible = false
	GameManager.state_changed.connect(_on_state_changed)
	btn_retry.mouse_entered.connect(_on_retry_entered)
	btn_quit.mouse_entered.connect(_on_quit_entered)

func _on_state_changed(state) -> void:
	if state == GameManager.GameState.GAME_OVER:
		visible = true
		score_label.text = "Score: " + str(GameManager.game_time)
	else:
		visible = false
	
func _on_btn_retry_pressed() -> void:
	GameManager.start_game()
	
func _on_retry_entered() -> void:
	AudioManager.play_button_audio()
	
func _on_quit_entered() -> void:
	AudioManager.play_button_audio()
