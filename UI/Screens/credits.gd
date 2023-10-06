extends Control

func _ready() -> void:
	if DataPlayer.is_dead:
		$SpritesDeathOmbres.show()

func _input(event) -> void:
	if event.is_action_pressed("interact"):
		MusicManager.play_sfx(0, 3.0)
		SceneTransition.goto_menu()
