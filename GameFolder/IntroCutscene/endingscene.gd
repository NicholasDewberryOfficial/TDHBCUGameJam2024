extends Node2D


var state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		0:
			pass
		1:
			$maintext.text = "With the mechanized reign of terror ended, the cactusfolk live to see the sunrise on their desert oasis once again."
		2:
			$maintext.text = "And it was all thanks to their combined resistance and the bravery of one small yet skilled cactus."
			
func appendText(text):
	if(! text in $maintext.text):
		$maintext.text += text
	
func _on_nextbutton_pressed():
	state +=1 
	pass # Replace with function body.
