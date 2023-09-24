extends StaticBody2D

@export var sprite : Sprite2D


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mimic_button_detect_area_entered(area: Area2D) -> void:
	sprite.material.set_shader_parameter("width", 8.0)


func _on_mimic_button_detect_area_exited(area: Area2D) -> void:
	sprite.material.set_shader_parameter("width", 0.0)
