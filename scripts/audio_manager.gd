extends Node

@onready var audios: Node = get_node("Audios")

@onready var jump_audio = audios.get_node("AudioJump")
@onready var game_over_audio = audios.get_node("AudioGameOver")
@onready var game_music_audio = audios.get_node("AudioGameMusic")
@onready var button_audio = audios.get_node("AudioButton")

func _ready() -> void:
	game_music_audio.finished.connect(_restart_music)

func play_jump() -> void :
	jump_audio.play()
	
func play_game_over() -> void:
	game_over_audio.play()
	
func play_game_music() -> void:
	game_music_audio.play()

func pause_game_music() -> void:
	game_music_audio.stop()
	
func play_button_audio() -> void:
	button_audio.play()

func _restart_music() -> void:
	game_music_audio.play()
