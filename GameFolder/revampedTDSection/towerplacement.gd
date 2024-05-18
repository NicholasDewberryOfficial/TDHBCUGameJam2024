extends Control


var currtower = null 
# 1= ham girl, 2=throwguy
var transphammergirl = load("res://revampedTDSection/towers/placetowergirl.tscn")
var hammgirlprefab = load("res://revampedTDSection/towers/hammergirl.tscn")
var placeme = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(placeme !=null):
		placeme.global_position = get_viewport().get_mouse_position()
		#print("should be changing in towerplacement script")
		
	if(currtower != null and placeme ==null):
		match(currtower):
			1:
				placeme = transphammergirl.instantiate()
				add_child(placeme)
	pass

func _input(event):
	if (event.is_action("lclick") and placeme!=null):
		match(currtower):
			1:
				var thisham = hammgirlprefab.instantiate()
				add_child(thisham)
				currtower=null
				placeme.queue_free()
				placeme=null
		


func _on_hammergirlpanel_pressed():
	currtower = 1
	pass # Replace with function body.
