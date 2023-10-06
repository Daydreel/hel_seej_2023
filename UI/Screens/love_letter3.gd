extends Control


func _on_button_pressed() -> void:
	MusicManager.play_sfx(0, 3.0)
	SceneTransition.goto_scene(SceneTransition.scenes[2].resource_path)
	MusicManager.music_transition(1)
