extends Node

func game_over():
	print("game over")
	SceneTransition.goto_scene(SceneTransition.scenes[5].resource_path)
