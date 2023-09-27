extends CharacterBody2D
class_name Moine

var has_talked = false

@onready var sprite : Sprite2D = $Sprite2D

@export_file("*.dialogue") var dialogue_path
@export var monk_texture : Texture

var _dialogue_box := preload("res://UI/Components/dialogue_box.tscn")

@export var music_state : int
@export var music_change : bool

func create_dialogue(path : String, image : Texture) -> void:
		var dialogue_box : DialogueBox = _dialogue_box.instantiate()
		dialogue_box.dialogue_path = path
		dialogue_box.monk_texture = image
		get_tree().root.add_child(dialogue_box)

func _on_aggro_range_area_entered(area):
	if !has_talked :
		has_talked = true
		create_dialogue(dialogue_path, monk_texture)
		
		if music_change:
			MusicManager.music_transition(music_state)
