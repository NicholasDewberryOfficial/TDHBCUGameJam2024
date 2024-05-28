extends Node

@export var mytimer: Timer

@export var Rollerbot: PackedScene

#It's gonna have 3 phases. 
#Phase 1 = 1 second gap 
#Phase 2 = .3 second gap
#Phase 3 = .1 second gap

@export var phase = 1

@export var timestogo = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timestogo ==0):
		phase = 20
		phase =2 
	match(phase):
		1:
			mytimer.wait_time = 1
		2:
			mytimer.wait_time = .3
		3:
			mytimer.wait_time = .1
		_:
			pass	
	pass


func _on_mobspawnmobtimer_timeout():
	var mybot = Rollerbot.instantiate()
	add_child(mybot)
	timestogo -=1 
	pass # Replace with function body.
