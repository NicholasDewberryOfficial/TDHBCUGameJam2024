extends Node2D

#So whats happening here? 
#So we've got a tilemap, with 2 tiles. On sand, it's placable, and on gravel it's not
#The area2d is coded to notice the gravel, and if its noticed, then we make placable=false
#so placable= true by default.
#Check th tilemap, and check the physics layers. Then see how I set up each physics layer to correspond
#with each tile in the tileset



var currTilemap
var placable = true


func _process(delta):
	global_position = get_viewport().get_mouse_position()
	





func _on_area_2d_body_entered(body):
	placable = false 
	#print("COLLIDED BODY ENTER ")
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	placable = true
	#print("COLLIDED BODY EXIT")
	pass # Replace with function body.
