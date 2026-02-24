extends Node2D

@onready var timer: Timer = get_node('Timer')

@onready var cactus: PackedScene = preload("res://scenes/cactus.tscn")

var min_time: int = 1
var max_time: int = 4

var turn_on: bool = false

func _ready() -> void:
	timer.start()
	GameManager.state_changed.connect(_on_state_changed)
	
	_on_state_changed(GameManager.current_state)
	
func generate_cactus() -> void:
	var cactus_scene = cactus.instantiate()
	cactus_scene.position = Vector2(830.0, 396.0)
	add_child(cactus_scene)
	
func _on_state_changed(state) -> void:
	if state == GameManager.GameState.PLAYING:
		turn_on = true

func _on_timer_timeout() -> void:
	if turn_on:
		generate_cactus()
	
	timer.wait_time = randi_range(min_time, max_time)
