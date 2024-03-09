extends Node

var HIGH_SCORE = 0

var save_path = "user://michael.save"

func save():
	var file = File.new()
	file.open(save_path, File.WRITE)
	file.store_8(HIGH_SCORE)
	file.close()
	
func load_data():
	var file = File.new()
	file.open(save_path, File.READ)
	HIGH_SCORE = file.get_8()
	file.close()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
