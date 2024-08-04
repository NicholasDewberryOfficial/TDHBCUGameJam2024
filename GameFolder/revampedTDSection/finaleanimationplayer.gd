extends AnimationPlayer

func _ready():
	play("transitiongame")
	await get_tree().create_timer(5.0).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://3dsection/3dgridworld.tscn")
