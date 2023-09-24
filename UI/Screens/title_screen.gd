extends Control


func _on_button_play_pressed():
	SceneTransition.goto_scene(SceneTransition.scenes[1].resource_path)
