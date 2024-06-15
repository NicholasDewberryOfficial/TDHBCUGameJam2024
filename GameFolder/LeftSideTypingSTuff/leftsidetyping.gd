extends Node2D


var difficulty: int = 1
var magicstring: String = ""
var size: int =4
var rng: RandomNumberGenerator
var progress: int= 0
# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	scrambletext()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	updatetexts()
	getpcinput()
	resetInput()
	$ProgressBar.value = progress
	
	if(progress == 4):
		progress = 0 
		get_tree().change_scene_to_file("res://IntroCutscene/endingscene.tscn")
	pass

func scrambletext(): 
	magicstring = ""
	while(magicstring.length() < size):
		var let = rng.randi_range(0,difficulty)
		match let:
			0:
				magicstring += "Q"
			1:
				magicstring +="A"
		

	pass

func updatetexts(): 
	$bgpanel/StringtoType.text = magicstring
	pass

func getpcinput():
	if (Input.is_action_just_pressed("Q")):
			$bgpanel/playerInput.text += "Q"
	if (Input.is_action_just_pressed("A")):
			$bgpanel/playerInput.text += "A"
	if (Input.is_action_just_pressed("Z")):
			$bgpanel/playerInput.text += "Z"

func resetInput():
	if($bgpanel/playerInput.text.length() == size and $bgpanel/playerInput.text == magicstring):
		progress +=1 
		scrambletext()
		pass
		
		


func _on_reset_pressed():
	$bgpanel/playerInput.text =""
	scrambletext()
	pass # Replace with function body.
