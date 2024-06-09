extends Control

var currentlyselectedType: int = 0
@export var artholder: TextureRect
#@export var throwerartreference: FileAccess
#@export var hammergirlartreference: CompressedTexture2D
@export var up1: Button
@export var up2: Button

#reference to the tower attaack script. 
#we call a function called (upgrade1) or (upgrade2) that applies the upgrades. 
var currentattackscript: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	changevalstoType()
	pass
	
func changevalstoType():
	match(currentlyselectedType):
		0:
			pass
		1:
			#var img = Image.load_from_file("res://Assets/Towers/Hammer Cactus Idle.png")
			var text = load("res://Assets/Towers/Hammer Cactus Idle.png")
			artholder.texture = text
			#artholder.texture = load(throwerartreference)
		2:
			#var img = ResourceLoader.load("res://Assets/Towers/Bomber Cactus Idle.png")
			var text = load("res://Assets/Towers/Bomber Cactus Idle.png")
			artholder.texture = text
			pass


func _on_upgrade_1_pressed():
	match(currentlyselectedType):
		1:
			pass
		2:
			currentattackscript.dmgdealt = 6
		
	pass
	pass # Replace with function body.


func _on_upgrade_2_pressed():
	match(currentlyselectedType):
		1:
			pass
		2:
			currentattackscript.atktime = .5
