extends Node

@export var mytimer: Timer

@export var Rollerbotleft: PackedScene

@export var Rollerbotright: PackedScene

@export var wavetext: RichTextLabel

@export var nextwavebuttonbutton: Button

@export var leftspawnholder: Node2D

@export var rightspawnholder: Node2D

var nextexecuting: bool = false
#It's gonna have 3 phases. 
#Phase 1 = 1 second gap 
#Phase 2 = .3 second gap
#Phase 3 = .1 second gap

#So what's happening here?
#1. we start in phase 0. this means that the timer isnt overriden. this gives the timer 10 seconds for gameplay to start.
#2. Afterwards, we populate the "timestogo" variable, then 
#*TODO update this code 
@export var phase = 0

var timestogo = 0

var midstagetimer: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(midstagetimer or phase ==0):
		wavetext.text = "Time until phase: " + str(phase) + " : " + str(round(mytimer.time_left))
		nextwavebuttonbutton.text = "Begin the next wave early."
		#return
	else:
		changetimerphase()
		wavetext.text = "Enemies left to spawn: " + str(timestogo)
		nextwavebuttonbutton.text = "Fast Forward wave spawns"
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
	var mybot 
	if(timestogo %2 == 1):
		mybot = Rollerbotleft.instantiate()
		mybot.position = Vector2(-230,0)
		mybot.scale = Vector2(1.25,1)
	else:
		mybot = Rollerbotright.instantiate()
		mybot.position = Vector2(-230,0)
		mybot.scale = Vector2(1.25,1)
		#mybot.global_position = rightspawnholder.global_position
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


func _on_nextwavebutton_pressed():
	if(nextexecuting):
		return
	else:
		nextexecuting=true
	if(midstagetimer == true):
		midstagetimer = false
		mytimer.stop()
		mytimer.start(.1)
	elif(midstagetimer == false):
		while(timestogo != 1):
			mytimer.autostart =false
			mytimer.stop()
			var mybot
			if(timestogo %2 == 1):
				mybot = Rollerbotleft.instantiate()
				#print(str(mybot.global_position))
				mybot.position = Vector2(-230,0)
				mybot.scale = Vector2(1.25,1)
				#mybot.global_position = leftspawnholder.global_position
			else:
				mybot = Rollerbotright.instantiate()
				mybot.position = Vector2(-230,0)
				mybot.scale = Vector2(1.25,1)
				pass
			add_child(mybot)
			timestogo -=1 
			await get_tree().create_timer(.2).timeout
		mytimer.autostart = true
		mytimer.start(.1)
	nextexecuting=false
