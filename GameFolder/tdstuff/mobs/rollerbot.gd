extends Node2D

@export var speed = 300
var Health = 10
var points: int =10

func _physics_process(delta):
	get_parent().set_progress(get_parent().get_progress() + (speed * delta))
	#print("Im spawning!")
	
	if Health <= 0:
		Globalvars.enemykilled(points)
		get_parent().get_parent().queue_free()
		
	if get_parent().get_progress_ratio() >= .97 :
		Globalvars.enemypassed()
		queue_free()
	 
	pass
	
