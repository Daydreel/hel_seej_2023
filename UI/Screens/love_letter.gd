extends Control


func _on_button_pressed() -> void:
	SceneTransition.goto_scene(SceneTransition.scenes[2].resource_path)
	MusicManager.music_transition(1)
