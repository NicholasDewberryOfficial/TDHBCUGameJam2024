extends Control


var currtower = null 
# 1= ham girl, 2=throwguy
var transphammergirl = load("res://revampedTDSection/towers/hammergirl/placetowergirl.tscn")
var hammgirlprefab = load("res://revampedTDSection/towers/hammergirl/hammergirl.tscn")
var longarmladyprefab = load("res://revampedTDSection/towers/LongarmLady/longarmtower.tscn")
@export var transpbomberguy: PackedScene
@export var bomberprefab: PackedScene
@export var transplongarmlady: PackedScene
var placeme = null

@export var totowerholder: Node

@export var tmap: TileMap
var tdata: TileSet
@export var hgirlcost:int = 100 
@export var pphpholder: RichTextLabel = null

@export var hammergirl1button: Button

@export var bomberguybutton: Button

@export var longarmLadybutton: Button

@export var page1holder: Control
@export var page2holder: Control



func _ready():
	if(Globalvars.unlockedTowers[0] ==0):
		hammergirl1button.disabled = true 
		hammergirl1button.hide()
	if(Globalvars.unlockedTowers[1] ==0):
		bomberguybutton.disabled = true 
		bomberguybutton.hide()
	if(Globalvars.unlockedTowers[2] == 0):
		longarmLadybutton.disabled = true
		longarmLadybutton.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
			2: 
				placeme = transpbomberguy.instantiate()
				add_child(placeme)
			3: 
				placeme = transplongarmlady.instantiate()
				add_child(placeme)
	pass

func _input(event):
	if (event.is_action("lclick") and placeme!=null and placeme.placable ==true):
		match(currtower):
			1:
				if(Globalvars.pp < 100):
					#logic saying youre poor and cant afford this 
					return 
				#logic that lets you buy
				Globalvars.pp -=100 
				var thisham = hammgirlprefab.instantiate()
				thisham.position = get_viewport().get_mouse_position()
				totowerholder.add_child(thisham)
				currtower=null
				placeme.queue_free()
				placeme=null
			2:
				if(Globalvars.pp < 150):
					#logic saying youre poor and cant afford this 
					return 
				Globalvars.pp -=150
				var thisham = bomberprefab.instantiate()
				thisham.position = get_viewport().get_mouse_position()
				totowerholder.add_child(thisham)
			#	print("PLACED BOMBERMAN")
				currtower=null
				placeme.queue_free()
				placeme=null
			3:
				if(Globalvars.pp < 300):
					#logic saying youre poor and cant afford this 
					return 
				Globalvars.pp -= 300
				var thisham = longarmladyprefab.instantiate()
				thisham.position = get_viewport().get_mouse_position()
				totowerholder.add_child(thisham)
			#	print("PLACED BOMBERMAN")
				currtower=null
				placeme.queue_free()
				placeme=null


func _on_hammergirlpanel_pressed():
	currtower = 1
	pass # Replace with function body.

#func checkifpositionworks() -> bool:
#	var pos = get_viewport().get_mouse_position()
	#Here we would see if the position is valid or not. 
	#return true #or return false
	
	
	


func _on_bomberpanel_pressed():
	currtower = 2
	pass # Replace with function body.


func _on_menubutton_item_selected(index):
	if(index == 0 ):
		page1holder.show()
		page2holder.hide()
	if(index == 1):
		page2holder.show()
		page1holder.hide()
	pass # Replace with function body.


func _on_longarm_lady_panel_pressed():
	currtower=3
	pass # Replace with function body.
