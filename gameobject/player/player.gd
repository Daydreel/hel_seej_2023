extends CharacterBody2D
class_name Player

@onready var hit_box : Area2D = $HitBox
@onready var sprite : Sprite2D = $FlipControl/Sprite2D
@onready var anim_state : AnimationTree = $AnimationTree
@onready var cinema_box : CanvasLayer = $Camera2D/CinemaBox

const speed : float = 200.0

@onready var foot_step_stream : AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	EventBus.dialogue_initiated.connect(_on_EventBus_dialogue_initiated)
	EventBus.dialogue_ended.connect(_on_EventBus_dialogue_ended)
	_cinema_mode_on()

func _physics_process(_delta: float) -> void:
	movement()



func movement() -> void:
	var direction : float = Input.get_axis("player_move_left", "player_move_right")
	velocity.x = direction * speed
	move_and_slide()
	
	if absf(direction) > 0.001:
		sprite.get_parent().scale.x = -1.0 if direction < 0.0 else 1.0
		
		anim_state["parameters/conditions/idle"] = false
		anim_state["parameters/conditions/running"] = true
	else:
		anim_state["parameters/conditions/running"] = false
		anim_state["parameters/conditions/idle"] = true


func _cinema_mode_on():
	cinema_box.show()


func _on_EventBus_dialogue_initiated() -> void:
	set_physics_process(false)
	anim_state["parameters/conditions/running"] = false
	anim_state["parameters/conditions/idle"] = true

func _on_EventBus_dialogue_ended() -> void:
	set_physics_process(true)

func _sfx_foot_step() -> void:
	foot_step_stream.play()
