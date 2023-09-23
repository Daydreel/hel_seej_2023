extends CharacterBody2D
class_name Moine

signal target_interact

var node_name : String = "Moine"
@export var sprite : Sprite2D

var player_looking : bool

func interact_available(state : bool) -> void:
	player_looking = state
	sprite.modulate = Color.BROWN if state else Color.WHITE



func _ready() -> void:
	target_interact.connect(interact_available)

func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and player_looking:
		print("speak")
