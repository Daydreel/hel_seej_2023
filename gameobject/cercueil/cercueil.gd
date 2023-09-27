extends StaticBody2D


@onready var sprite : Sprite2D = $Sprite2D


func _on_mimic_button_detect_area_entered(area: Area2D) -> void:
	sprite.material.set_shader_parameter("width", 8.0)


func _on_mimic_button_detect_area_exited(area: Area2D) -> void:
	sprite.material.set_shader_parameter("width", 0.0)
