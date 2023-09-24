extends StaticBody2D


func _on_area_2d_area_entered(area):
	print(area.get_parent().name)
	if area.get_parent().name == "Player" :
		SceneTransition.goto_scene(SceneTransition.scenes[6].resource_path)
