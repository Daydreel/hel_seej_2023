extends TextureRect


func _on_timer_timeout():
	SceneTransition.goto_scene(SceneTransition.scenes[1].resource_path)
