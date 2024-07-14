extends Node

var pchealth: int  = 10
var pcdefensemod: float = 1
#0 = pc attacks. 1=pc defends 
var state: int =0 
#TODO, add timer function to force player to attack/defend 
@export var goalball: Sprite2D
@export var movingball: PathFollow2D
@export var curremy: emyres
#change a pointer to enemy health, not the hunderlying hp resource 
#seet when we load in enemy 
var thisemyhealth = 10 
@export var basedamage: float = .03
@export var playerhptext: RichTextLabel 
@export var enemyhptext: RichTextLabel 
@export var enemytexture: TextureRect
@export var chomperres: emyres
@export var rollerres: emyres
@export var propellerres: emyres
@export var goaltexture: Sprite2D
@export var atktexture: Texture2D
@export var dfdtexture: Texture2D
var emekilledinrpg: int =0

func ready():
	loadenemy()

func _physics_process(delta):
	if(Input.is_action_just_pressed("Q")):
		attackfunction()
		pass
	if(Input.is_action_just_pressed("w")):
		healfunction()
	playerhptext.text = str("Player Health: " + str(snapped(pchealth,1)))
	enemyhptext.text = str("Enemy Health: " + str(snapped(thisemyhealth,1)))
	if(thisemyhealth <=0):
		deademy()
	pass

#Refactor guide: 

func attackfunction():
	if(state == 0):
		runplayerdamage()
	else:
		runenemydamage()
	
func runplayerdamage(): 
	var damagemod = 300 - movingball.position.distance_to(goalball.position)
	var curdmg = basedamage*damagemod
	thisemyhealth -= (curdmg)
	$bgpanel/EnemyPanel/emydmgpopup/textbg/emydmgtext.text = "Takes: " + str(snapped(curdmg,1))
	$bgpanel/EnemyPanel/emydmgpopup.play("NormDamage")
	swapstate() 
	
	
func runenemydamage(): 
	pchealth -= curremy.damage * pcdefensemod 
	swapstate()
	pass

func swapstate():
	if(state == 0):
		state = 1 
		goaltexture.texture = dfdtexture
		
	else:
		state = 0 
		goaltexture.texture = atktexture
	
func deademy(): 
	#give score 
	Globalvars.pp += curremy.points
	
	loadenemy()
	
func loadenemy():
	$bgpanel/EnemyPanel/emydmgpopup.play("EmyChange")
	var rng =  randi_range(0,3)
	match rng:
		1:
			curremy = propellerres 
		2:
			curremy = rollerres
		3: 
			curremy = chomperres
	enemytexture.texture = curremy.picture
	thisemyhealth = curremy.health

func healfunction():
	if(Globalvars.pp < 200):
		pass
		#UR TOO POOR
	else:
		Globalvars.pp -= 200 
		pchealth += 10
