extends Node2D

@onready var bird_timer: Timer = get_node('Timer')

@onready var bird: PackedScene = preload("res://scenes/bird.tscn")

var min_time: int = 4
var max_time: int = 6
var min_pos: float = 218.0
var max_pos: float = 358.0

var turn_on: bool = false

func _ready() -> void:
	bird_timer.wait_time = randi_range(min_time, max_time)
	bird_timer.start()
	GameManager.state_changed.connect(_on_state_changed)
	
	_on_state_changed(GameManager.current_state)
	
func generate_bird() -> void:
	var bird_scene = bird.instantiate()
	bird_scene.position = Vector2(830.0, randf_range(min_pos, max_pos))
	add_child(bird_scene)
	
func _on_state_changed(state) -> void:
	if state == GameManager.GameState.PLAYING:
		turn_on = true

func _on_timer_timeout() -> void:
	if turn_on:
		generate_bird()
	
	bird_timer.wait_time = randi_range(min_time, max_time)
