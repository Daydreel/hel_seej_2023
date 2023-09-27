extends Button

var trap = false

#func _ready():
#	set_physics_process(false)

func _physics_process(_delta):
	if trap:
		scale *= 1.005

func _on_mouse_entered():
	text = "J'AVOUE !"
	trap = true


func _on_pressed():
	EventBus.admission.emit()
	queue_free()
