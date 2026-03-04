extends StaticBody2D

@onready var sprite = $Texture
@onready var collision_top = $CollisionTop
@onready var collision_top_2 = $CollisionTop2
@onready var collision_left = $CollisionLeft
@onready var collision_right = $CollisionRight

@export var sprite_texture: Texture2D
@export var spritesheet_width: float = 64.0
@export var sprite_sheet_height: float = 64.0

var type_cactus: Array = [Rect2(0, 0, 32, 32), Rect2(32, 0, 32, 32), Rect2(0, 32, 32, 32)]
var speed: float = 200.0
var index: int

func _ready() -> void:
	index = randi_range(0, 2)
	select_cactus_texture()
	define_collision_size()
	
func _process(delta: float) -> void:
	move_cactus(delta)
	destroy_cactus()

func select_cactus_texture() -> void:
	sprite.region_enabled = true
	sprite.texture = sprite_texture
	sprite.region_rect = type_cactus[index]
	
func define_collision_size() -> void:
	if index == 0:
		collision_top_2.disabled = true
		collision_top.shape.size = Vector2(4.5, 5.0)
		collision_left.shape.size = Vector2(3.5, 5.0)
		collision_right.shape.size = Vector2(3.5, 5.0)
		collision_top.position = Vector2(0.0, -9.6)
		collision_left.position = Vector2(-5.5, -3.7)
		collision_right.position = Vector2(4.5, -4.7)
	elif index == 1:
		collision_top_2.disabled = true
		collision_top.shape.size = Vector2(4.5, 5.0)
		collision_left.shape.size = Vector2(3.5, 5.0)
		collision_right.shape.size = Vector2(3.5, 5.0)
		collision_top.position = Vector2(-1.0, -6.7)
		collision_left.position = Vector2(-5.5, -1.7)
		collision_right.position = Vector2(4.5, -0.7)
	else:
		collision_top_2.disabled = false
		collision_top.shape.size = Vector2(13.0, 5.25)
		collision_top_2.shape.size = Vector2(4.5, 3.0)
		collision_left.shape.size = Vector2(4.0, 6.0)
		collision_right.shape.size = Vector2(4.0, 6.0)
		collision_top.position = Vector2(-3.0, -5.5)
		collision_top_2.position = Vector2(6.0, -10.7)
		collision_left.position = Vector2(-11.5, -0.3)
		collision_right.position = Vector2(10.5, -6.3)

func move_cactus(delta: float) -> void:
	
	position.x -= GameManager.game_speed_cactus * delta
	
func destroy_cactus() -> void:
	if position.x < -50.0:
		queue_free()
