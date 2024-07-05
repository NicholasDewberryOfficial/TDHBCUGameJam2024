extends Area2D

#reduce speed by this much. by default: .75
var reducespeedamt: float  = .75
@export var myanims: AnimationPlayer = null
var inrange: int =0

var upgrade1: bool = false
var upgrade2: bool=false

func checkupgrades():
	if(upgrade1 == true):
		#dmgdealt = 3
		pass
	if(upgrade2 ==true):
		#atktime = .5
		#Lets have the AOE double in size
		pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(inrange == 0):
		myanims.play("idle")
	else:
		myanims.play("slam")
	pass


func _on_area_entered(area):
	if(area.has_method("modifyspeed")):
		area.modifyspeed(reducespeedamt)
		inrange = inrange+1
	#	print("ENEMY DETECTED")
		pass
	pass # Replace with function body.


func _on_area_exited(area):
	if(area.has_method("modifyspeed")):
		area.modifyspeed(1)
		inrange = inrange-1
		pass
	pass # Replace with function body.
