extends Button

var trap = false

func _ready():
	mouse_entered.connect(_on_mouse_entered)

func _physics_process(_delta):
	if trap:
		scale *= 1.005

func _on_mouse_entered():
	text = "J'AVOUE !"
	trap = true
	mouse_entered.disconnect(_on_mouse_entered)


func _on_pressed():
	EventBus.admission.emit()
	queue_free()
