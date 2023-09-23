extends Control

@onready var dialogue_label : DialogueLabel = $Dialogue/MC/DialogueLabel
@onready var character_label : RichTextLabel = $Character/MC/CharacterLabel

var r_dialogue : DialogueResource = load("res://assets/dialogues/d1_test.dialogue")
var dialogue_line

var await_answer : bool = false

func _ready():
	start_dialogue("talk_to_test")
	display_dialogue()


func _input(event):
	if event.is_action_pressed("dialogic_default_action") :
		if await_answer :
			return
		
		if dialogue_line :
			next(dialogue_line.next_id)
		if dialogue_line :
			print(dialogue_line.id, " ", dialogue_line)
			if !dialogue_line.responses.is_empty():
				display_choices()
			display_dialogue()


func start_dialogue(title : String):
	dialogue_line = await r_dialogue.get_next_dialogue_line(title)


func display_dialogue():
	if !dialogue_line :
		print("the end")
		return
	print("display_dialogue ", dialogue_line)
	dialogue_label.dialogue_line = dialogue_line
	character_label.text = dialogue_line.character


func display_choices():
	await_answer = true
	for choice in dialogue_line.responses:
		var button = Button.new()
		button.text = choice.text
		$GridContainer.add_child(button)
		button.pressed.connect(_on_button_pressed.bind(choice))


## Go to the next line
func next(next_id: String) -> void:
	dialogue_line = await r_dialogue.get_next_dialogue_line(next_id)


func _on_button_pressed(choice : DialogueResponse):
	print(choice.text, " ", choice.id, " next_id = ", choice.next_id)
	$GridContainer.get_children().clear()
	next(choice.next_id)
	await_answer = false
	display_dialogue()
