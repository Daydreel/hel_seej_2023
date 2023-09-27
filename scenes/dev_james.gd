extends Node2D


func _ready():
	var dialogue = load("res://UI/Components/dialogue_box.tscn").instantiate()
	dialogue.dialogue_path = "res://assets/dialogues/d1_test.dialogue"
	add_child(dialogue)
