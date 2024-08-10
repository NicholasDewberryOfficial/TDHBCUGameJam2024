extends Area2D
#Script conttrols enemy taking damage and death
#simple integers. 
#note: base enemy = rollerbot
@export var health: float = 10
@export var points: int =10

@export var myspeed: Node2D
@export var damageanim: AnimationPlayer
@export var deathsound: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(deathsound.playing == true):
		"WHERES THE DEATHSOUND"
	if health <= 0:
		deathcycle()

		
	pass

func takedamage(givendmg):
	health -= givendmg
	damageanim.play("damageanim")
#	print(health)

func modifyspeed(newspeedamt: float):
	myspeed.slowdownmod = newspeedamt 

func deathcycle(): 
	#TODO MAYBE?
	#Enemies should have 
	Globalvars.enemykilled(points)
	damageanim.play("deathanim")
	deathsound.play()
	self.collision_layer = 9
	self.collision_mask = 9
	self.global_position = Vector2(1900,1900)
	myspeed.slowdownmod = 0
	myspeed.dying = true
	await get_tree().create_timer(1).timeout 
	get_parent().get_parent().queue_free()
