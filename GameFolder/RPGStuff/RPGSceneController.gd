extends Node2D

@export var pchealth: int
@export var currenemy: emyres

var ehealth: int 
var edamage: int 
var rng: RandomNumberGenerator

var trackenemyToFight: int 

var dontdoathing: bool = false
var initializing:bool = false

var ppAMT: int = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	currenemy = ResourceLoader.load("res://RPGStuff/eresources/rollerbot.tres")
	ehealth = currenemy.health
	edamage = currenemy.damage
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(pchealth <= 0):
		deathLogic()
	updateCounters()
	if(ehealth <= 0):
		$bgpanel/EnemyPanel/emydmgpopup.play("EmyChange")
		$bgpanel/PlayerPanel/OverallContainer.visible = false
		dontdoathing = true
		if(initializing == false):
			initializing = true
			if(currenemy != null):			
				givepointsToPlayer()
			InitializeEnemy()
		await get_tree().create_timer(1.0).timeout
		dontdoathing=false
		$bgpanel/PlayerPanel/OverallContainer.visible = true
		
	if(dontdoathing): 
		pass
	else:	
		if (Input.is_action_just_pressed("Q")):
			_on_bash_button_pressed()
		if(Input.is_action_just_pressed("A")):
			_on_poke_button_pressed()
		pass

func deathLogic():
	pass


func InitializeEnemy(): 
	if(initializing):
		initializing = true
		print("Initialzed!")
		var newEM = rng.randi_range(0,2)
		match newEM:
			0:
				currenemy = ResourceLoader.load("res://RPGStuff/eresources/rollerbot.tres")
			1:
				currenemy = ResourceLoader.load("res://RPGStuff/eresources/propeller.tres")
			2:
				currenemy = ResourceLoader.load("res://RPGStuff/eresources/Chomper.tres")
		$bgpanel/EnemyPanel/EnemySprite.texture = (currenemy.picture)
		ehealth = currenemy.health
		edamage = currenemy.damage
		initializing = false
		pass
	
func updateCounters(): 
	
	$bgpanel/PlayerPanel/PlayerHP.text = "Myrtle HP: " + str(pchealth)
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
			$bgpanel/EnemyPanel/emydmgpopup/textbg/emydmgtext.text = "Takes: " + str(dmgval)
			$bgpanel/EnemyPanel/emydmgpopup.play("NormDamage")
			return dmgval
		1:
			
			$bgpanel/EnemyPanel/emydmgpopup/textbg/emydmgtext.text = "[wave amp=60.0 freq=9.0 connected=1] CRIT! " + str(dmgval*2) + " [/wave]"
			$bgpanel/EnemyPanel/emydmgpopup.play("CritDamage")
			return dmgval *2
		2:
			$bgpanel/EnemyPanel/emydmgpopup/textbg/emydmgtext.text = "[shake rate = 20.0 level=5 connected=1] Resists: " + str(dmgval/2) + " [/shake]"
			$bgpanel/EnemyPanel/emydmgpopup.play("DefendedDamage")
			return dmgval/2 


func _on_fireball_pressed():
	pass # Replace with function body.

func givepointsToPlayer():
	match str(currenemy.name):
		"rollerbot":
			pass #return 5 points
		"chomper":
			pass
		"roller":
			pass
	pass


func _on_mega_bash_pressed():
	if(ppAMT - 10 < 0):
		pass
	else:
		ppAMT -= 10
		var dmg = gimmieDamage(0,6)
		ehealth -= dmg
		emyTurn()
	pass # Replace with function body.


func _on_disperse_pressed():
	var dmg = 4
	pchealth -= dmg
	dmg = gimmieDamage(2,dmg)
	ehealth -= dmg
	emyTurn()
	pass # Replace with function body.




func _on_sunbathe_pressed():
	var currhp = 0
	emyTurn()
	ppAMT += (currhp - pchealth)
	pass # Replace with function body.
	



func _on_pierce_pressed():
	if(ppAMT - 10 < 0):
		pass
	else:
		ppAMT -= 10
		var dmg = gimmieDamage(1,6)
		ehealth -= dmg
		emyTurn()
	pass # Replace with function body.
