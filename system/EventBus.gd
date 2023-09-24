extends Node

signal admission #aveu en anglais
signal drop_cercueil
signal dialogue_initiated
signal dialogue_ended

func game_over():
	SceneTransition.goto_scene(SceneTransition.scenes[3].resource_path)
