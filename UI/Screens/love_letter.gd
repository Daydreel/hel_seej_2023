extends Control

func _on_timer_timeout():
	SceneTransition.goto_scene(SceneTransition.scenes[2].resource_path)
