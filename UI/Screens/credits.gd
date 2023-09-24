extends Control

func _input(event):
	if event.is_action_pressed("interact"):
		SceneTransition.goto_menu()
