extends StaticBody2D

@onready var sprite = $Texture
@onready var collision = $Collision

@export var sprite_texture: Texture2D
@export var spritesheet_width: float = 64.0
@export var sprite_sheet_height: float = 64.0

var type_cactus: Array = [Rect2(0, 0, 32, 32), Rect2(32, 0, 32, 32), Rect2(0, 32, 32, 32)]
var speed: float = 200.0

func _ready() -> void:
	select_cactus_texture()
	define_collision_size()
	
func _process(delta: float) -> void:
	move_cactus(delta)
	destroy_cactus()

func select_cactus_texture() -> void:
	sprite.region_enabled = true
	sprite.texture = sprite_texture
	sprite.region_rect = type_cactus[randi_range(0, 2)]
	
func define_collision_size() -> void:
	collision.scale = Vector2(3.0, 4.0)

func move_cactus(delta: float) -> void:
	position.x -= speed * delta
	
func destroy_cactus() -> void:
	if position.x < -50.0:
		queue_free()
