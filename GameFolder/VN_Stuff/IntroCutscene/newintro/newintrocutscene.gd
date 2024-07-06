extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("Intro_Cutscene")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Dialogic.current_timeline == null):
		Dialogic.start_timeline("Intro_Cutscene")
	pass
