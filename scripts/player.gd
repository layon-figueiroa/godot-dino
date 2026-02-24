extends CharacterBody2D

@onready var dino_animation: AnimatedSprite2D = get_node('AnimTexture')
@onready var dino_collision_body: CollisionShape2D = get_node("CollisionBody")
@onready var dino_collision_head: CollisionShape2D = get_node("CollisionHead")

var gravity_force: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_force: float = -500.0
var is_jumping: bool = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		apply_gravity(delta)
	else:
		move_player()
		
	move_and_slide()
	
	detect_collision()

func apply_gravity(delta: float) -> void:
	velocity.y += gravity_force * delta
	
func move_player() -> void:
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_force
			dino_animation.play('jump')
		elif Input.is_action_pressed("ui_down"):
			dino_animation.play('lower_run')
		else:
			dino_animation.play('run')

func detect_collision() -> void:
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i).get_collider()
		if collision.is_in_group("Obstacle"):
			GameManager.end_game()
