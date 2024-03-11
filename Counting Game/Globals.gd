extends Node

var HIGH_SCORE = 0

var save_path = "user://michael.save"

func save():
	var file = File.new()
	file.open(save_path, File.WRITE)
	file.store_64(HIGH_SCORE)
	file.close()
	
func load_data():
	var file = File.new()
	file.open(save_path, File.READ)
	HIGH_SCORE = file.get_64()
	file.close()

# Called when the node enters the scene tree for the first time.
func _ready():
	var song = preload("res://Audio/soundtrack.ogg")
	Sfxhandler.play_sfx_loop(song, self)


#func _process(delta):
#	pass
