extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var count = 0
const increment = 1

var ones = 0
var tens = 0
var hundreds = 0
var thousands = 0
var thousandTens = 0
var thousandHundreds = 0

var playSfx = false
const wait = 35
var timerOnes = wait
var timerTens = wait
var timerHundreds = wait
var timerHundreds2 = wait
var timerThousands = wait
var timerThousands2 = wait
var timerThousands3 = wait
var timerThousands4 = wait
var timerThousands5 = wait

var rng = RandomNumberGenerator.new()
var countWait = 30

const sfx = [preload("res://Audio/1.wav"), preload("res://Audio/1.wav"), preload("res://Audio/2.wav"), 
preload("res://Audio/3.wav"), 
preload("res://Audio/4.wav"), preload("res://Audio/5.wav"), preload("res://Audio/6.wav"), 
preload("res://Audio/7.wav"), preload("res://Audio/8.wav"), preload("res://Audio/9.wav"), 
preload("res://Audio/10.wav"), preload("res://Audio/11.wav"), preload("res://Audio/12.wav"), 
preload("res://Audio/13.wav"), preload("res://Audio/14.wav"), preload("res://Audio/15.wav"),
preload("res://Audio/16.wav"), preload("res://Audio/17.wav"), preload("res://Audio/18.wav"), 
preload("res://Audio/19.wav")] 

const sfxTens = [preload("res://Audio/10.wav"), preload("res://Audio/10.wav"), preload("res://Audio/20.wav"), 
preload("res://Audio/30.wav"),
preload("res://Audio/40.wav"), preload("res://Audio/50.wav"), preload("res://Audio/60.wav"), 
preload("res://Audio/70.wav"), preload("res://Audio/80.wav"), preload("res://Audio/90.wav")]

const sfxHundred = preload("res://Audio/hundred.wav")
const sfxThousand = preload("res://Audio/thousand.wav")
const sfxMillion = preload("res://Audio/million.wav")

var encourageRNG #gets number between 1 and 10. If 10, play encouragement sound effect
var sfxEncourageNum
const sfxEncourage = [preload("res://Audio/Louder1.wav"), preload("res://Audio/Louder2.wav"), preload("res://Audio/Louder3.wav"), 
preload("res://Audio/Louder4.wav"), preload("res://Audio/Louder5.wav")]

onready var encourageStream = $AudioStreamPlayer
var encourageSndPlayed = false

func playOnesSfx():
	if timerOnes == wait: Sfxhandler.play_sfx(sfx[ones], self)
	timerOnes -= 1
	if timerOnes <= 0: playSfx = false
	
func playTensSfx():
	if tens < 2: timerTens = 0
	if timerTens == wait: Sfxhandler.play_sfx(sfxTens[tens], self)
	timerTens -= 1 
	if ones != 0:
		if timerTens <= 0:
			playOnesSfx()
	else:
		if timerTens <= 0: playSfx = false

func playHundredsSfx():
	if timerHundreds == wait: Sfxhandler.play_sfx(sfx[hundreds], self)
	timerHundreds -= 1
	if timerHundreds <= 0:
		if timerHundreds2 == wait: Sfxhandler.play_sfx(sfxHundred, self)
		timerHundreds2 -= 1
		if timerHundreds2 <= 0:
			playTensSfx()
			
func playThousandsSfx():
	if timerThousands == wait and thousands != 0: Sfxhandler.play_sfx(sfx[thousands], self)
	if thousands == 0: timerThousands = 0
	timerThousands -= 1
	if timerThousands <= 0:
		if timerThousands2 == wait: Sfxhandler.play_sfx(sfxThousand, self)
		timerThousands2 -= 1
		if timerThousands2 <= 0:
			if hundreds > 0: playHundredsSfx()
			else: playTensSfx()

func playThousandTensSfx():
	if timerThousands3 == wait: Sfxhandler.play_sfx(sfxTens[thousandTens], self)
	timerThousands3 -= 1 
	if timerThousands3 <= 0:
		playThousandsSfx()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(count)
	if playSfx:
		if thousandHundreds > 0:
			if timerThousands4 == wait: Sfxhandler.play_sfx(sfx[thousandHundreds], self)
			timerThousands4 -= 1
			if timerThousands4 <= 0:
				if timerThousands5 == wait: Sfxhandler.play_sfx(sfxHundred, self)
				timerThousands5 -= 1
				if timerThousands5 <= 0:
					playThousandTensSfx()
		elif thousandTens > 1 and thousandTens < 10:
			playThousandTensSfx()
		elif thousands > 0 and thousands < 20:
			playThousandsSfx()
		elif hundreds > 0:
			playHundredsSfx()
		elif tens > 1:
			playTensSfx()
		else:
			playOnesSfx()
	if !playSfx: 
		countWait -= 1
		if countWait <= 0:
			if !encourageSndPlayed: encourageRNG = rng.randi_range(0, 10)
			if encourageRNG < 10:
				Count()
				countWait = rng.randi_range(20,30)
			else:
				if !encourageSndPlayed: 
					sfxEncourageNum = rng.randi_range(0, 4)
					encourageStream.stream = sfxEncourage[sfxEncourageNum]
					encourageStream.play()
					encourageSndPlayed = true
				if !encourageStream.playing and encourageSndPlayed:
					Count()
					countWait = rng.randi_range(20,30)
					encourageSndPlayed = false
		
		
		

func Count():
	count += increment
	
	ones += increment
	if ones == 10 or ones == 20: 
		tens += 1
		if tens > 1:
			ones = 0
	if tens > 9:
		hundreds += 1
		tens = 0
	if hundreds > 9:
		thousands += 1
		hundreds = 0
	if thousands == 10 or thousands == 20:
		thousandTens += 1
		if thousandTens > 1:
			thousands = 0
	if thousandTens > 9:
		thousandHundreds += 1
		thousandTens = 0
	
	#reset all timers and playSfx in delta time
	timerOnes = wait
	timerTens = wait
	timerHundreds = wait
	timerHundreds2 = wait
	timerThousands = wait
	timerThousands2 = wait
	timerThousands3 = wait
	timerThousands4 = wait
	timerThousands5 = wait
	playSfx = true
		
	if count > Globals.HIGH_SCORE:
		Globals.HIGH_SCORE = count

# If number's final character is a 1 and its second to last character is not a 1, play "one"
# Same with 2, 3, 4, 5, 6, 7, 8, 9
# If number's final two characters are 10, play "ten", same with rest of the teens
# If number's second to last character is 2, play "twenty", same with 30, 40, 50, 60, 70, 80, 90
# If number's third to last character is 1, play "one hundred", same with 200, 300, 400, 500, 600, 700, 800, 900
# If any character is 0, ignore it
# Repeat same set of steps for thousands. when 1,000,000 is reached, you are winner
# You'll need sound effects for 1-19, 20, 30, 40, 50, 60, 70, 80, 90, hundred, thousand, million
