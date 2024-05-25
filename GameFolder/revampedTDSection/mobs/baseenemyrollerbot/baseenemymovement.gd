extends Node2D

@export var speed = 300


func _physics_process(delta):
	get_parent().set_progress(get_parent().get_progress() + (speed * delta))
	#print("Im spawning!")
	
	if get_parent().get_progress_ratio() >= .97 :
		Globalvars.enemypassed()
		get_parent().get_parent().queue_free()
	 
	pass
	
