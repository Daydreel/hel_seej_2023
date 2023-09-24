extends Node

var surname = "John Doe"

#Some states
var is_trapped = false
var is_door_trapped = false
var is_dead = false

func _ready() -> void:
	EventBus.admission.connect(_on_EventBus_admission)


func _on_EventBus_admission() -> void:
	is_door_trapped = true
