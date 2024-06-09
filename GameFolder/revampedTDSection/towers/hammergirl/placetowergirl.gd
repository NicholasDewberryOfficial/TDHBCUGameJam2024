extends Node2D

#So whats happening here? 
#So we've got a tilemap, with 2 tiles. On sand, it's placable, and on gravel it's not
#The area2d is coded to notice the gravel, and if its noticed, then we make placable=false
#so placable= true by default.
#Check th tilemap, and check the physics layers. Then see how I set up each physics layer to correspond
#with each tile in the tileset



var currTilemap
var placable = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_viewport().get_mouse_position()
	#print("Should be changing in placetowergirlscript")
	pass


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#if(body is TileMap):
		#currTilemap = TileMap
		#var tilecoords = currTilemap.get_coords_for_body_rid(body_rid)
		#var mydata = currTilemap.get_custom_data_by_layer_id()
	pass # Replace with function body.
#https://piped.video/watch?v=k9RsnbP4a0c&ab_channel=DevDuck


#func _on_area_2d_area_entered(area):
	#placable = false 
	#print("COLLIDED AREA ENTER ")
	#pass # Replace with function body.
#
#
#func _on_area_2d_area_exited(area):
	#placable = true
	#print("COLLIDED AREA EXIT")
	#pass # Replace with function body.


func _on_area_2d_body_entered(body):
	placable = false 
	#print("COLLIDED BODY ENTER ")
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	placable = true
	#print("COLLIDED BODY EXIT")
	pass # Replace with function body.
