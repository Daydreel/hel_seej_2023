extends Control

@onready var line_edit_name = $LineEditName
@onready var virtual_keyboard = $VBKeyboard

var buttons_name = [
	"A","B", "C", "D", "E", "F", "G", "H", "I", "J",
	"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", 
	"V", "X", "Y", "X"
]

func _ready():
	for letter in buttons_name :
		var button = Button.new()
		button.text = letter
		button.pressed.connect(_on_letter_button_pressed.bind(letter))
		virtual_keyboard.add_child(button)


func _on_play_button_pressed():
	SceneTransition.goto_scene(SceneTransition.scenes[3].resource_path)
	DataPlayer.surname = line_edit_name.text


func _on_letter_button_pressed(letter):
	line_edit_name.text += letter
