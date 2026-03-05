extends Control

@onready var btn_start: Button = $V_ContainerStartScene/BtnStart
@onready var btn_quit: Button = $V_ContainerStartScene/BtnQuit

func _ready() -> void:
	#visible = true
	GameManager.state_changed.connect(_on_state_changed)
	
	_on_state_changed(GameManager.current_state)
	
	btn_start.mouse_entered.connect(_on_start_entered)
	btn_quit.mouse_entered.connect(_on_quit_entered)

func _on_state_changed(state) -> void:
	if state == GameManager.GameState.MENU:
		visible = true
	else:
		visible = false
	
func _on_btn_start_pressed() -> void:
	GameManager.start_game()
	
func _on_start_entered() -> void:
	AudioManager.play_button_audio()
	
func _on_quit_entered() -> void:
	AudioManager.play_button_audio()
