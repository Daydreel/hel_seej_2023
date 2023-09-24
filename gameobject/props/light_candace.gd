extends PointLight2D

signal tween_finish

var tween : Tween
var ping_pong : bool


func start_tween() -> void:
	tween.stop()
	tween.tween_property(self, "scale", Vector2(0.9, 0.9) if ping_pong else Vector2.ONE, 0.2)
	tween.play()
	ping_pong = false if ping_pong else true



func _ready() -> void:
	tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_SINE)
	start_tween()
	tween.finished.connect(start_tween)
