extends TextureProgressBar

@onready var music = $AudioStreamPlayer
var up_velocity = 5.0

func _ready():
	value_changed.connect(_on_value_changed)
	_on_value_changed(value)
	value = 10

func _on_value_changed(value):
	var lineal_value = value / float (max_value)
	if lineal_value <= 0:
		music.volume_db = -80
	else:
		music.volume_db = linear_to_db(lineal_value)
