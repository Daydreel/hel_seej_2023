extends Node2D

var button_clicked : bool
var in_cercueil : StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_clicked:
		position = get_global_mouse_position()
		

func _on_button_pressed() -> void:
	if button_clicked and in_cercueil != null:
		button_clicked = false
#		in_cercueil.get_parent().mimic_button_drop()
		print("mimic dropped")
		
	else:
		button_clicked = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	in_cercueil = area.get_parent()


func _on_area_2d_area_exited(area: Area2D) -> void:
	in_cercueil = null
