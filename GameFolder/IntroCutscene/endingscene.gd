extends Node2D


var state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		0:
			$endingtext.text = "With the mechanized reign of terror ended, the cactusfolk live to see the sunrise on their desert oasis once again."
		1:
			appendText("\n \nAnd it was all thanks to their combined resistance and the bravery of one small yet skilled cactus.")
		2:
			$Panel2.hide()
			$Panel3.hide()	
			$endingtext.hide()
			$nextbutton.text = "Return to Title Screen"
		3:
			get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")
			
func appendText(text):
	if(! text in $endingtext.text):
		$endingtext.text += text
	
func _on_nextbutton_pressed():
	state +=1 
	pass # Replace with function body.
