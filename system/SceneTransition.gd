extends Control

@export var scenes : Array[PackedScene]
@onready var anim_p = $AnimationPlayer


func fade_in():
	anim_p.play("fade_in")


func fade_out():
	anim_p.play("fade_out")


func goto_menu():
	goto_scene(scenes[0].resource_path)


func goto_scene(path : String) -> void:
	fade_in()
	await anim_p.animation_finished
	get_tree().change_scene_to_file(path)
	fade_out()
