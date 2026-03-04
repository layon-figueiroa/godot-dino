extends Node2D

@export var timer: Timer

var turn_on: bool = false

func _ready() -> void:
	timer.wait_time = 1.0
	timer.start()
	GameManager.state_changed.connect(_on_state_changed)
	
	_on_state_changed(GameManager.current_state)
	
func _on_state_changed(state) -> void:
	if state == GameManager.GameState.PLAYING:
		turn_on = true

func _on_timer_timeout() -> void:
	if turn_on:
		GameManager.add_time()
		timer.wait_time = 1.0
