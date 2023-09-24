extends Control

@onready var anim_p = $AnimationPlayer

func _ready():
	anim_p.play("scary")
	DataPlayer.is_dead = true




func _on_animation_player_animation_finished(anim_name):
	SceneTransition.goto_scene(SceneTransition.scenes[5].resource_path)
