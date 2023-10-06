extends AudioStreamPlayer



var music : Array[AudioStreamOggVorbis] = [preload("res://assets/audio/MENU.ogg"), preload("res://assets/audio/Eglise-niveau_0.ogg"), preload("res://assets/audio/Eglise_niveau_1.ogg"), preload("res://assets/audio/Eglise_niveau_2.ogg"), preload("res://assets/audio/Eglise_niveau_Max.ogg"), preload("res://assets/audio/END.ogg")]
@export var audio_stream_2 : AudioStreamPlayer
@export var transition_player : AnimationPlayer
var back : bool = false
var tween : Tween
@export_range(0.0, 1.0) var volume : float = 1.0

@export var global_sfx : AudioStreamPlayer
var sfx_volume_db : float = 0.0
var sfx : Array = [preload("res://assets/audio/selection boite lettres.wav"), preload("res://assets/audio/porte.wav"), preload("res://assets/audio/Clock.ogg"), preload("res://assets/audio/Cloche.ogg")]

var sfx_mumbling : Array[AudioStreamOggVorbis] = [preload("res://assets/audio/Mumbling1.ogg"), preload("res://assets/audio/Mumbling2.ogg"), preload("res://assets/audio/Mumbling3.ogg"), preload("res://assets/audio/Mumbling4.ogg")]
@export var stream_mumbling : AudioStreamPlayer
#var rng_mumbling := RandomNumberGenerator.new()
var mumblig_order : int = 0

func music_transition(music_selected : int) -> void:
	if back:
		self.stream = music[music_selected]
		self.play()
		
		transition_player.play_backwards("transition")
#		tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR)
#		tween.tween_property(self, "volume_db", linear_to_db(volume), 2.0)
#		tween.tween_property(audio_stream_2, "volume_db", linear_to_db(0.0), 2.0)
		
		
		back = false
	else:
		audio_stream_2.stream = music[music_selected]
		audio_stream_2.play()
		
		transition_player.play("transition")
#		tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR)
#		tween.tween_property(audio_stream_2, "volume_db", linear_to_db(volume), 2.0)
#		tween.tween_property(self, "volume_db", linear_to_db(0.0), 2.0)
		back = true

func  play_sfx(sfx_index : int, sfx_db : float) -> void:
	global_sfx.stream = sfx[sfx_index]
	global_sfx.volume_db = sfx_db
	global_sfx.play()

func stop_sfx() -> void:
	global_sfx.stop()

func play_mumbling() -> void:
	stream_mumbling.volume_db = 2.5
#	stream_mumbling.stream = sfx_mumbling[rng_mumbling.randi_range(0, 3)]
	stream_mumbling.stream = sfx_mumbling[mumblig_order]
	mumblig_order += 1
	stream_mumbling.play()
	
func stop_mumbling() -> void:
	tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(stream_mumbling, "volume_db", -80.0, 1.0)

func change_volume(power : float) -> void:
	volume = power
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(volume))


func stop_musics():
	self.stop()
	audio_stream_2.stop()

func _ready() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(volume))
