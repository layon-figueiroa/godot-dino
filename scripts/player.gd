extends CharacterBody2D

@onready var dino_animation: AnimatedSprite2D = get_node('AnimTexture')
@onready var collision_head: CollisionShape2D = get_node("CollisionHead")
@onready var collision_hand: CollisionShape2D = get_node("CollisionHand")

var gravity_force: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_force: float = -600.0
var jump_cut: float = 0.5
var is_jumping: bool = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		apply_gravity(delta)
	else:
		move_player()
		
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_force
			dino_animation.play('jump')
			
	if Input.is_action_just_released("jump"):
		velocity.y *= jump_cut
		dino_animation.play("jump")
		
	move_and_slide()
	
	detect_collision()

func apply_gravity(delta: float) -> void:
	velocity.y += gravity_force * delta
	
func move_player() -> void:
	if Input.is_action_pressed("ui_down"):
		dino_animation.play('lower_run')
		collision_head.position = Vector2(33.0, -3.0)
		collision_hand.position = Vector2(20.0, 20.0)
	else:
		dino_animation.play('run')
		collision_head.position = Vector2(20.0, -26.0)
		collision_hand.position = Vector2(15.5, -0.25)

func detect_collision() -> void:
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i).get_collider()
		if collision.is_in_group("Obstacle"):
			GameManager.end_game()
