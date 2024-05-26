extends Node2D
#for enemy movment. the way that enemy movement works is that theres a path2d node father, and a pathfollow node child, and then
#under that child, the rest of the functional nodes sit (movement timer, art,hitbox)
#What we're doing is we are moviung that child along the father's path
#basically, we're just following this script that goes along the path. 
@export var speed = 300


func _physics_process(delta):
	get_parent().set_progress(get_parent().get_progress() + (speed * delta))
	#print("Im spawning!")
	
	if get_parent().get_progress_ratio() >= .97 :
		#if the enemy goes past, then we take the nexus hp away, and delete this node.
		Globalvars.enemypassed()
		get_parent().get_parent().queue_free()
	 
	pass
	