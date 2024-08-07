extends Node
#look up how to normalize a set of values 
var pchealth: int  = 10
var pcdefensemodstat: float = .03
var pcdefensemodaction: float=1
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

@export var tasklistnode: Node
@export var buttonreference: Button
@export var panelreference: Panel

var parentcombocountershouldbequal: int = 0
#signal combocounterreached(comboamt)

func ready():
	loadenemy()
	panelreference.process_mode = Node.PROCESS_MODE_DISABLED
	print("should be paused. ")
	
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
	if(parentcombocountershouldbequal >= 5):
		tasklistnode.currcomboreference = parentcombocountershouldbequal
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
	pcdefensemodaction = 100 - 1/movingball.position.distance_to(goalball.position)
	#print(pcdefensemodaction)
	pchealth -= curremy.damage * pcdefensemodstat * pcdefensemodaction
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


func _on_lockedb_button_pressed():
	if(Globalvars.pp >= 500):
		Globalvars.pp = Globalvars.pp - 500
		buttonreference.visible = false 
		buttonreference.disabled = true
		panelreference.process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.
