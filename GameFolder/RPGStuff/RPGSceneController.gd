extends Node2D

@export var pchealth: int
@export var currenemy: emyres

var ehealth: int 
var edamage: int 
var rng: RandomNumberGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	InitializeEnemy()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(pchealth <= 0):
		deathLogic()
	updateCounters()
	if (Input.is_action_just_pressed("Q")):
		_on_bash_button_pressed()
	pass

func deathLogic():
	pass
	
func InitializeEnemy(): 
	if(currenemy == null): 
		currenemy = ResourceLoader.load("res://RPGStuff/eresources/basicbot.tres")
	ehealth = currenemy.health
	edamage = currenemy.damage
	pass
	
func updateCounters(): 
	$bgpanel/PlayerPanel/PlayerHP.text = "Player HP: " + str(pchealth)
	$bgpanel/EnemyPanel/EnemyHP.text = "Enemy HP: "+ str(ehealth)
	


func _on_bash_button_pressed():
	#var dmg = rng.randi_range(1,3)
	var dmg = 2
	dmg = gimmieDamage(0,dmg)
	#can have switch statement for extra damage here 
	#so like is emyclass.defenses[0] ==1 bash does extra damage 
	ehealth -= dmg
	emyTurn()
	pass # Replace with function body.
	
func emyTurn():
	pchealth -= edamage
	#particle effects for player losing health


func _on_poke_button_pressed():
	var dmg  =2 
	dmg = gimmieDamage(1,dmg)
	ehealth -= dmg
	emyTurn()
	pass # Replace with function body.

func gimmieDamage(index, dmgval):
	match(currenemy.defences[index]):
		0:
			$bgpanel/EnemyPanel/emydmgpopup/emydmgtext.text = "Takes: " + str(dmgval)
			$bgpanel/EnemyPanel/emydmgpopup.play("NormDamage")
			return dmgval
		1:
			
			$bgpanel/EnemyPanel/emydmgpopup/emydmgtext.text = "[wave amp=30.0 freq=3.0 connected=1] CRIT! " + str(dmgval*2) + " [/wave]"
			$bgpanel/EnemyPanel/emydmgpopup.play("CritDamage")
			return dmgval *2
		2:
			return dmgval/2 
