extends Control

@onready var anim_p = $AnimationPlayer
@onready var the_end_screen = $TheEnd
@onready var button = $Button

func _ready():
	anim_p.play("scary")
	DataPlayer.is_dead = true




func _on_animation_player_animation_finished(anim_name):
	button.set_visible(true)
	the_end_screen.set_visible(true)


func _on_button_pressed() -> void:
	SceneTransition.goto_scene(SceneTransition.scenes[5].resource_path)
