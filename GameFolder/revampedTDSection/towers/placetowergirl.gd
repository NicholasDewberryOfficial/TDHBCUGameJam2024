extends Node2D

#remember, 1 = hmrgirl, 2 =thrower 
#@export var ttype : int = 1 


var currTilemap
var placable = false
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
	print("COLLIDED BODY ENTER ")
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	placable = true
	print("COLLIDED BODY EXIT")
	pass # Replace with function body.
