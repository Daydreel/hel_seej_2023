extends Control


func _on_button_play_pressed():
	MusicManager.play_sfx(0, 3.0)
	SceneTransition.goto_scene(SceneTransition.scenes[1].resource_path)


func _on_button_credit_pressed():
	MusicManager.play_sfx(0, 3.0)
	SceneTransition.goto_scene(SceneTransition.scenes[5].resource_path)


func _on_button_quit_pressed():
	MusicManager.play_sfx(0, 3.0)
	get_tree().quit()
