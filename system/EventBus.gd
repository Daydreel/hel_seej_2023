extends Node

signal admission #aveu en anglais
signal drop_cercueil
signal dialogue_initiated
signal dialogue_ended

func game_over():
	print("game over")
	SceneTransition.goto_scene(SceneTransition.scenes[5].resource_path)
