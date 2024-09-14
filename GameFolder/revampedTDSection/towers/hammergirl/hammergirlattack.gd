extends Node

#Alright so whats happening here?
#Baically, whenever an enemy enters the detection radius, they're added into an array. 
#We only focus the enemy that's the first to enter the array.
#once we find the enemy, start the tiimer and then attack.
var currenemyarr = []

@export var atktimer: Timer
@export var dmgdealt: float 
#var atktime: Float = 
var curtarget: Node2D
var ap: AnimationPlayer

var rotvector = 0.0

var rotspeed= 5

@export var dmghitbox: PackedScene

var upgrade1: bool = false
var upgrade2: bool= false
func checkupgrades():
	if(upgrade1 == true):
		dmgdealt = 3
		pass
	if(upgrade2 ==true):
		#atktime = .5
		#Lets have the AOE double in size
		pass
 



# Called when the node enters the scene tree for the first time.
func _ready():
	ap = get_parent().get_child(0)
	#dmghitbox = load("res://revampedTDSection/towers/hammerdmghitbox.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotateTowards()
	if(atktimer.is_stopped() and !currenemyarr.is_empty()):
		startattack()
	pass

func _physics_process(delta):
	var direction = self.position
	if(!currenemyarr.is_empty()):
		direction = currenemyarr[0].global_position - get_parent().global_position
	else:
		return
	var angle_to_target = direction.angle()
	var angle_diff = angle_to_target - get_parent().rotation
	var rotation_amount = rotspeed * delta
	if abs(angle_diff) > rotation_amount:
		get_parent().rotation += rotation_amount * sign(angle_diff)
	else:
			# If the angle difference is smaller than the rotation amount, rotate directly to the target
		get_parent().rotation = angle_to_target
	get_parent().rotation += (rotvector) * rotspeed * delta 



func _on_area_entered(area):
	if(area.is_in_group("enemyhitboxgroup")):
		currenemyarr.push_back(area)
	pass # Replace with function body.


func _on_area_exited(area):
	if(area.is_in_group("enemyhitboxgroup")):
		currenemyarr.erase(area)
	pass # Replace with function body.

func startattack():
	if(atktimer.is_stopped()):
		startslam()
		atktimer.start()
		
		#attack logic goes here
	else:
		pass
		
		
func startslam():
	atktimer.start(2)
	ap.play("windup")
	await get_tree().create_timer(1).timeout
	ap.play("slam")
	var cdmg = dmghitbox.instantiate()
	cdmg.damage = dmgdealt
	if(upgrade2 == true):
		cdmg.scale = Vector2(2,2)
	add_child(cdmg)
	#var currdmg = add_child(ResourceLoader.load("res://revampedTDSection/towers/hammerdmghitbox.tscn"))
	await get_tree().create_timer(1).timeout
	ap.play("idle")
	#start windupanimation logic here 

func rotateTowards():
	if(!currenemyarr.is_empty()):
		rotvector = self.global_position.angle_to(currenemyarr[0].get_parent().position)
	else:
		rotvector = 0.0     
	
	#var rotatiton = Vector2.from_angle()

@export var attackDistance: Sprite2D
func showAttackDistance(): 
	attackDistance.show()
func hideAttackDistance():
	attackDistance.hide()
