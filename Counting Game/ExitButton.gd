extends Button

onready var _transition_rect := $"/root/HUD/TransitionLayer/SceneTransitionRect"

const sfxClick = preload("res://Audio/exit.wav")

func _pressed() -> void:
	Sfxhandler.play_sfx(sfxClick, self)
	_transition_rect.transition_to("res://TitleScreen.tscn")

