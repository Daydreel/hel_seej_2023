extends CharacterBody2D
class_name Player

@onready var camera : Camera2D = preload("res://gameobject/player/camera_player.tscn").instantiate()
@export var area_self : Area2D
@export var sprite : Sprite2D
@export var anim_state : AnimationTree

@export var speed : float = 300.0
var speed_manipulation : float = 1.0
var backward_move : bool = false

var area_selected : Area2D

func _ready() -> void:
#	get_parent().add_child.call_deferred(camera)
	add_child(camera)


#func _process(delta: float) -> void:
#	camera.position = self.position

func _physics_process(_delta: float) -> void:

	var direction : float = Input.get_axis("player_move_left", "player_move_right")
	velocity.x = direction * speed * speed_manipulation
	move_and_slide()
	
	
	
	if absf(direction) > 0.001:
		sprite.flip_h = true if direction < 0.0 else false
		
		anim_state["parameters/conditions/idle"] = false
		anim_state["parameters/conditions/running"] = true
	else:
		anim_state["parameters/conditions/running"] = false
		anim_state["parameters/conditions/idle"] = true


func _process(_delta: float) -> void:
	var area_target : Area2D = null
	for i in area_self.get_overlapping_areas():
		if area_target == null:
			area_target = i
		if area_target != null:
			area_target = i if position.distance_to(area_target.global_position) > position.distance_to(i.global_position) else area_target
	if area_selected != area_target and area_target != null:
		if area_selected != null:
			area_selected.get_parent().emit_signal("target_interact", false)
		area_selected = area_target
		area_target.get_parent().emit_signal("target_interact", true)




func _on_area_2d_area_entered(_area: Area2D) -> void:
#	var area_target : Area2D = null
#	for i in area_self.get_overlapping_areas():
#		if area_target == null:
#			area_target = i
#		if area_target != null:
#			area_target = i if position.distance_to(area_target.position) > position.distance_to(i.position) else area_target
#
#	area_target.get_parent().emit_signal("target_interact", true)
	pass

func _on_area_2d_area_exited(area: Area2D) -> void:
	area.get_parent().emit_signal("target_interact", false)
	if area_selected == area:
		area_selected = null
