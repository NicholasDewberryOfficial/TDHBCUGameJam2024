extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$statspanel/pplabel.text = "PP: " + str(Globalvars.pp)
	$statspanel/enemiesdefeatedlabel.text = "Enemies defeated: " + str(Globalvars.enemiesdefeated)
	$statspanel/corehp.text = "corehp: " + str(Globalvars.corehp)
	pass
