extends Control


var currtower = null 
# 1= ham girl, 2=throwguy
var transphammergirl = load("res://revampedTDSection/towers/hammergirl/placetowergirl.tscn")
var hammgirlprefab = load("res://revampedTDSection/towers/hammergirl/hammergirl.tscn")
var placeme = null

@export var totowerholder: Node

@export var tmap: TileMap
var tdata: TileSet
@export var hgirlcost:int = 100 
@export var pphpholder: RichTextLabel = null


func _ready():
	#totowerholder = get_node()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pphpholder.text = "[b] PP: [/b]" + str(Globalvars.pp) + "\n [b] HP: [/b]" + str(Globalvars.corehp)
	if(placeme !=null):
		placeme.global_position = get_viewport().get_mouse_position()
		tdata = tmap.tile_set
		#print("should be changing in towerplacement script")
		
	if(currtower != null and placeme ==null):
		match(currtower):
			1:
				placeme = transphammergirl.instantiate()
				add_child(placeme)
	pass

func _input(event):
	if (event.is_action("lclick") and placeme!=null and placeme.placable ==true):
		match(currtower):
			1:
				if(Globalvars.pp < 100):
					#logic saying youre poor and cant afford this 
					return 
				Globalvars.pp -=100 
				var thisham = hammgirlprefab.instantiate()
				thisham.position = get_viewport().get_mouse_position()
				
				totowerholder.add_child(thisham)
				currtower=null
				placeme.queue_free()
				placeme=null
		


func _on_hammergirlpanel_pressed():
	currtower = 1
	pass # Replace with function body.

func checkifpositionworks() -> bool:
	var pos = get_viewport().get_mouse_position()
	#Here we would see if the position is valid or not. 
	return true #or return false
	
	
