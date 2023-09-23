extends CharacterBody2D


const SPEED = 300.0
func _ready():
	EventBus.admission.connect(_on_EventBus_admission)
	set_physics_process(false)

func _physics_process(delta):

	var direction = -1.0
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_EventBus_admission():
	await get_tree().create_timer(1.0).timeout
	set_physics_process(true)
