extends ColorRect

export(String, FILE, "*.tscn") var next_scene_path

onready var _anim_player := $AnimationPlayer

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_anim_player.play_backwards("Fade")

func transition_to(_next_scene := next_scene_path) -> void:
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	get_tree().change_scene(_next_scene)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
