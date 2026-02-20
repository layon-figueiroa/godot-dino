extends CharacterBody2D

var gravity_force: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_force: float = -400.0
var is_jumping: bool = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		apply_gravity(delta)
	else:
		jump()
		
	move_and_slide()

func apply_gravity(delta: float) -> void:
	velocity.y += gravity_force * delta
	
func jump() -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
