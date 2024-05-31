extends Node

@export var mytimer: Timer

@export var Rollerbot: PackedScene

@export var wavetext: RichTextLabel
#It's gonna have 3 phases. 
#Phase 1 = 1 second gap 
#Phase 2 = .3 second gap
#Phase 3 = .1 second gap

@export var phase = 0

var timestogo = 0

var midstagetimer: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(midstagetimer or phase ==0):
		wavetext.text = "Time until phase: " + str(phase) + " : " + str(round(mytimer.time_left))
		#return
	else:
		changetimerphase()
		wavetext.text = "Enemies left to spawn: " + str(timestogo)
	if(timestogo <=0 and !midstagetimer):
		#timestogo = 20
		phase += 1 
		match (phase):
			0:
				pass
			1:
				timestogo=20
			2:
				timestogo = 30
			3:
				timestogo = 60
			_:
				timestogo = 100
		mytimer.autostart = false
		mytimer.stop()
		mytimer.wait_time = 10
		midstagetimer = true
		mytimer.autostart=true
		mytimer.start()
		return
	
	changetimerphase()
	pass


func _on_mobspawnmobtimer_timeout():
	if(phase ==0):
		midstagetimer=false
		mytimer.stop()
		mytimer.wait_time=.01
		mytimer.start()
		return
	if(midstagetimer):
		changetimerphase()
		midstagetimer=false
	var mybot = Rollerbot.instantiate()
	add_child(mybot)
	timestogo -=1 
	pass # Replace with function body.

func changetimerphase():
	match(phase):
		0:
			pass
		1:
			mytimer.wait_time = 1
		2:
			mytimer.wait_time = .3
		3:
			mytimer.wait_time = .1
		_:
			mytimer.wait_time = .005
			pass	
