extends Control

var currentlyselectedType: int = 0
@export var artholder: TextureRect
#@export var throwerartreference: FileAccess
#@export var hammergirlartreference: CompressedTexture2D
@export var up1: Button
@export var up2: Button

var cost1: int 
var cost2: int 
#reference to the tower attaack script. 
#we call a function called (upgrade1) or (upgrade2) that applies the upgrades. 
#can al
var currentattackscript: Node2D

signal upgradecompleted
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#seeIfWeClickGround()
	changevalstoType()
	if(currentattackscript ==null):
		return
	if(currentattackscript.upgrade1 == true):
		up1.disabled = true
		pass 
	else:
		up1.disabled = false
	if(currentattackscript.upgrade2 == true):
		up2.disabled = true
	else:
		up2.disabled = false
		
	if(currentattackscript.has_method("showAttackDistance")):
		currentattackscript.showAttackDistance()
	
	
func changevalstoType():
	match(currentlyselectedType):
		0:
			pass
		1:
			#var img = Image.load_from_file("res://Assets/Towers/Hammer Cactus Idle.png")
			var text = load("res://Assets/Towers/Hammer Cactus Idle.png")
			artholder.texture = text
			up1.text = "2X Damage: 200 PP"
			cost1 = 200
			up2.text = "Triple attack size: 400 PP"
			cost2 = 400
			#artholder.texture = load(throwerartreference)
		2:
			#var img = ResourceLoader.load("res://Assets/Towers/Bomber Cactus Idle.png")
			var text = load("res://Assets/Towers/Bomber Cactus Idle.png")
			artholder.texture = text
			up1.text = "2X Damage: 200 PP"
			cost1 = 200
			up2.text = "2X atk Speed: 200PP"
			cost2=200
			pass
	

func _on_upgrade_1_pressed():
	if(Globalvars.pp < cost1):
		return
	Globalvars.pp -= cost1
	match(currentlyselectedType):
		1:
			currentattackscript.upgrade1 = true
			currentattackscript.dmgdealt = 3
		2:
			currentattackscript.upgrade1=true
			currentattackscript.dmgdealt = 6
	upgradecompleted.emit()	
	pass
	pass # Replace with function body.


func _on_upgrade_2_pressed():
	if(Globalvars.pp < cost2):
		return
	Globalvars.pp -= cost2
	match(currentlyselectedType):
		1:		
			currentattackscript.upgrade2 = true
		2:
			currentattackscript.upgrade2=true
			currentattackscript.atktime = .5
	upgradecompleted.emit()


func hideTheAttackArt(): 
	currentattackscript.hideAttackDistance()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(currentattackscript and currentattackscript.has_method("hideAttackDistance")):
				currentattackscript.hideAttackDistance()
				up1.text = ""
				up2.text = ""
				artholder.texture = null
				currentattackscript = null
