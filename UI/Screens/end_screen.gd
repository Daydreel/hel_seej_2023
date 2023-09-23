extends Control


func _on_timer_timeout():
	SceneTransition.goto_scene(SceneTransition.scenes[6].resource_path)
