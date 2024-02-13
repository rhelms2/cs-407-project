extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(count)


func _on_Button_pressed():
	count += 1
	if count > Globals.HIGH_SCORE:
		Globals.HIGH_SCORE = count
