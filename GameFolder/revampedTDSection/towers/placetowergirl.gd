extends Node2D

#remember, 1 = hmrgirl, 2 =thrower 
#@export var ttype : int = 1 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_viewport().get_mouse_position()
	#print("Should be changing in placetowergirlscript")
	pass
