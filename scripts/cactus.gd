extends StaticBody2D

@onready var sprite = $Texture
@onready var collision = $Collision

@export var sprite_texture: Texture2D
@export var spritesheet_width: float = 64.0
@export var sprite_sheet_height: float = 64.0

var teste = Rect2(0, 0, 32, 32)

func _ready() -> void:
	select_cactus_texture()

func select_cactus_texture() -> void:
	sprite.region_enabled = true
	sprite.texture = sprite_texture
	sprite.region_rect = teste
