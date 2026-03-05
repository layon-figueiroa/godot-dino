extends Node

signal state_changed(new_state)

enum GameState {MENU, PLAYING, GAME_OVER}

var current_state: GameState = GameState.MENU
var game_time: int = 0
var game_speed_bird: float = 300.0
var game_speed_cactus: float = 200.0
var difficulty_rate: float = 1.0

func _process(delta: float) -> void:
	if current_state == GameState.PLAYING:
		game_speed_bird += difficulty_rate * delta
		game_speed_cactus += difficulty_rate * delta

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
	AudioManager.play_game_music()
	
func enter_game_over() -> void:
	AudioManager.pause_game_music()
	AudioManager.play_game_over()
	get_tree().paused = true
	
###################################

func start_game() -> void:
	change_game_state(GameState.PLAYING)
	game_time = 0
	game_speed_bird = 300.0
	game_speed_cactus = 200.0
	
func end_game() -> void:
	change_game_state(GameState.GAME_OVER)

func go_to_menu() -> void:
	change_game_state(GameState.MENU)
	
func add_time() -> void:
	game_time += 1
