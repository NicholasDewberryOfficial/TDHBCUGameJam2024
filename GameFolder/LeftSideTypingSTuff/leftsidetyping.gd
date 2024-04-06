extends Node2D


var difficulty: int = 1
var magicstring: String = ""
var size: int =4
var rng: RandomNumberGenerator
# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	scrambletext()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updatetexts()
	getpcinput()
	pass

func scrambletext(): 
	while(magicstring.length() < size):
		var let = rng.randi_range(0,difficulty)
		match let:
			0:
				magicstring += "q"
			1:
				magicstring +="a"
		

	pass

func updatetexts(): 
	$bgpanel/StringtoType.text = magicstring
	pass

func getpcinput():
	pass	
