extends Control


func _on_button_pressed() -> void:
	SceneTransition.goto_scene(SceneTransition.scenes[6].resource_path)
#	MusicManager.music_transition(1)
	
	
