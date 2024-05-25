extends Area2D
#Script conttrols enemy taking damage and death
#simple integers. 
#note: base enemy = rollerbot
@export var health: float = 10
@export var points: int =10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if health <= 0:
		Globalvars.enemykilled(points)
		get_parent().get_parent().queue_free()
		
	pass

func takedamage(givendmg):
	health -= givendmg

