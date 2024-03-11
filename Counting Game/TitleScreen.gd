extends CanvasLayer


var audioTimer = 180
var rng = RandomNumberGenerator.new()
var sfxNum
const sfx = [preload("res://Audio/intro1.wav"), preload("res://Audio/intro2.wav"), preload("res://Audio/intro3.wav")]
var sfxPlayed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	sfxNum = rng.randi_range(0, 2)
	Globals.load_data()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	audioTimer -= 1
	if audioTimer <= 0 and !sfxPlayed:
		Sfxhandler.play_sfx(sfx[sfxNum], self)
		sfxPlayed = true
