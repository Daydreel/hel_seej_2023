extends Control

func _ready() -> void:
	if DataPlayer.is_dead:
		$SpritesDeathOmbres.show()

func _input(event) -> void:
	if event.is_action_pressed("interact"):
		SceneTransition.goto_menu()
