extends StaticBody2D

@export var door_sfx : AudioStreamPlayer
func _on_area_2d_area_entered(area):
	print(area.get_parent().name)
	if area.get_parent().name == "Player" && DataPlayer.is_door_trapped:
		MusicManager.play_sfx(1, 2.0)
		SceneTransition.goto_scene(SceneTransition.scenes[4].resource_path)
