extends Button

onready var _transition_rect := $"/root/TitleScreen/TransitionLayer/SceneTransitionRect"

func _pressed() -> void:
	_transition_rect.transition_to("res://CountTogether.tscn")

