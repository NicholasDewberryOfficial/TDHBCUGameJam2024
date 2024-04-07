extends CharacterBody2D

var speed = 100 
var Health = 100
var points: int =100

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
	
