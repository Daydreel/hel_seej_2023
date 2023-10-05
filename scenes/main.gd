extends Node2D


func _input(event):
	if event.is_action_pressed("escape"):
		SceneTransition.goto_menu()
		MusicManager.music_transition(0)
