extends CharacterBody2D

@onready var anim_texture: AnimatedSprite2D = $AnimTexture
@onready var collision_wing: CollisionShape2D = $CollisionWing

var speed: float = 300.0

func _ready() -> void:
	anim_texture.frame_changed.connect(_on_frame_changed)
	
func _process(delta: float) -> void:
	move_bird(delta)
	destroy_bird()
	
func move_bird(delta: float) -> void:
	position.x -= speed * delta
	
func destroy_bird() -> void:
	if position.x < -50.0:
		queue_free()
	
func _on_frame_changed() -> void:
	if anim_texture.frame == 3:
		collision_wing.disabled = false
	else:
		collision_wing.disabled = true
