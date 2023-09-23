extends Control
class_name DialogueBox

@onready var dialogue_label : DialogueLabel = $CL/Dialogue/MC/DialogueLabel
@onready var character_label : RichTextLabel = $CL/Character/MC/CharacterLabel
@onready var grid_buttons : GridContainer = $CL/GridContainer

var dialogue_path : String
var r_dialogue : DialogueResource 
var dialogue_line

var await_answer : bool = false

func _ready():
	r_dialogue = load(dialogue_path)
	start_dialogue("dialogue")
	display_dialogue()


func _input(event):
	if event.is_action_pressed("dialogue_default_action") :
		if await_answer :
			return
		
		if dialogue_line :
			next(dialogue_line.next_id)

		if dialogue_line :
			print(dialogue_line.id, " ", dialogue_line)
			if !dialogue_line.responses.is_empty():
				display_choices()
			display_dialogue()
		else :
			end_dialogue()


func start_dialogue(title : String):
	dialogue_line = await r_dialogue.get_next_dialogue_line(title)


func display_dialogue():
	if !dialogue_line :
		end_dialogue()
		return
	print("display_dialogue ", dialogue_line)
	dialogue_label.dialogue_line = dialogue_line
	character_label.text = dialogue_line.character


func display_choices():
	await_answer = true
	for choice in dialogue_line.responses:
		var button = Button.new()
		button.text = choice.text
		grid_buttons.add_child(button)
		button.pressed.connect(_on_button_pressed.bind(choice))


## Go to the next line
func next(next_id: String) -> void:
	dialogue_line = await r_dialogue.get_next_dialogue_line(next_id)


func end_dialogue():
	queue_free()


func _on_button_pressed(choice : DialogueResponse):
	print(choice.text, " ", choice.id, " next_id = ", choice.next_id)
	for button in grid_buttons.get_children() :
		button.queue_free()
	next(choice.next_id)
	await_answer = false
	display_dialogue()
