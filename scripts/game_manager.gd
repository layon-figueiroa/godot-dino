extends Node

signal state_changed(new_state)

enum GameState {MENU, PLAYING, GAME_OVER}

var current_state: GameState = GameState.MENU

func change_game_state(new_state: GameState) -> void:
	if current_state == new_state:
		return
		
	current_state = new_state
	state_changed.emit(current_state)
	
	match current_state:
		GameState.MENU:
			enter_menu()
		GameState.PLAYING:
			enter_playing()
		GameState.GAME_OVER:
			enter_game_over()
	
#########ENTER STATES############

func enter_menu() -> void:
	get_tree().paused = true
	
func enter_playing() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	current_state = GameState.PLAYING
	
func enter_game_over() -> void:
	get_tree().paused = true
	
###################################

func start_game() -> void:
	change_game_state(GameState.PLAYING)
	
func end_game() -> void:
	change_game_state(GameState.GAME_OVER)

func go_to_menu() -> void:
	change_game_state(GameState.MENU)
