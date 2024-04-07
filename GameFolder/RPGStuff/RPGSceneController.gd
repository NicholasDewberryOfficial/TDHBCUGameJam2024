extends Node2D

@export var pchealth: int = 30
@export var currenemy: emyres
@export_node_path() var SkillList_path

var ehealth: int 
var edamage: int 
var rng: RandomNumberGenerator

var trackenemyToFight: int 

var dontdoathing: bool = false
var initializing:bool = false

var givethesepoints: int = 10

var progress = 0

var nextstage = 300 


@onready var Skill_List = $"bgpanel/PlayerPanel/OverallContainer/LeftSideContainer/SkillList"

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	currenemy = ResourceLoader.load("res://RPGStuff/eresources/rollerbot.tres")
	ehealth = currenemy.health
	edamage = currenemy.damage
	add_items()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(pchealth <= 0):
		deathLogic()
	updateCounters()
	if(ehealth <= 0):
		$mechanicexplosion.play()
		Globalvars.pp += givethesepoints
		progress += givethesepoints
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
		if(Input.is_action_just_pressed("Z")):
			_on_sunbathe_pressed()
		pass

func deathLogic():
	$bgpanel/EnemyPanel/emydmgpopup.play("deathanim")
	$yelp.play()
	Globalvars.pp -= 100
	pchealth = 30
	pass


func InitializeEnemy(): 
	if(initializing):
		initializing = true
		print("Initialzed!")
		var newEM = rng.randi_range(0,2)
		match newEM:
			0:
				currenemy = ResourceLoader.load("res://RPGStuff/eresources/rollerbot.tres")
				givethesepoints= 10
			1:
				currenemy = ResourceLoader.load("res://RPGStuff/eresources/propeller.tres")
				givethesepoints=10
			2:
				currenemy = ResourceLoader.load("res://RPGStuff/eresources/Chomper.tres")
				givethesepoints=100
		$bgpanel/EnemyPanel/EnemySprite.texture = (currenemy.picture)
		ehealth = currenemy.health
		edamage = currenemy.damage
		initializing = false
		pass
	
func updateCounters(): 
	
	$bgpanel/PlayerPanel/PlayerHP.text = "Myrtle HP: " + str(pchealth)
	$bgpanel/EnemyPanel/EnemyHP.text = "Enemy HP: "+ str(ehealth)
	$bgpanel/PlayerPanel/PlayerPP.text = "Myrtle PP: " + str(Globalvars.pp)
	$bgpanel/PlayerPanel/Panel/ProgressBar.value = progress
	if(progress >= 300):
		#$bgpanel/EnemyPanel/emydmgpopup.play("transferphase")
		Globalvars.goNext()
		pass #NEXT PHASE
	
	if(Globalvars.pp - 10 < 0):
		disable_item(1)
		disable_item(2)
		
	if (Globalvars.pp - 10 > 0):
		enable_item(1)
		enable_item(2)


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
	dmgval = (dmgval * Globalvars.mdmg)
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
	## if(ppAMT - 10 < 0):
	##	pass
	## else:
	Globalvars.pp -= 10
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
	Globalvars.pp += (currhp - pchealth)
	pass # Replace with function body.
	

func _on_pierce_pressed():
	## if(ppAMT - 10 < 0):
		##pass
	## else:
	Globalvars.pp -= 10
	var dmg = gimmieDamage(1,6)
	ehealth -= dmg
	emyTurn()
	pass # Replace with function body.

func add_items():
	Skill_List.add_item("Disperse")
	Skill_List.add_item("Mega Bash")
	Skill_List.add_item("Pierce")
	

func _on_skill_list_item_selected(index):
	print(index)
	match (index):
		0:
			_on_disperse_pressed()
		1:
			_on_mega_bash_pressed()
		2:
			_on_pierce_pressed()
	
	pass # Replace with function body.

func disable_item(index):
	Skill_List.set_item_disabled(index, true)
	
func enable_item(index):
	Skill_List.set_item_disabled(index, false)
	


func _on_myrtle_hp_up_pressed():
	if(Globalvars.pp - 60 < 0):
		pass
	else:
		Globalvars.pp -=60 
		pchealth += 20 
	pass # Replace with function body.
