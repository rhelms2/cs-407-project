extends Button

onready var _transition_rect := $"/root/TitleScreen/TransitionLayer/SceneTransitionRect"

const sfxClick = preload("res://Audio/click.wav")

func _pressed() -> void:
	Sfxhandler.play_sfx(sfxClick, self)
	_transition_rect.transition_to("res://CountTogether.tscn")

