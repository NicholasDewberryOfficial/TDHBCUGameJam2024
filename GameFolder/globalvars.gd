extends Node


@export var pp: int = 800

@export var tddifficulty: int = 0

@export var tddamagemultiplier: int = 1
	
@export var corehp: int = 10

@export var enemiesdefeated=0 

@export var mdmg: int = 1

@export var checkbool: bool = false

@export var beeper: AudioStreamPlayer2D

#placements: 0=hammergirl, 1 =throwerguy, 2=sniperlady
#values: 1 = unlocked. 0 means locked. 
@export var unlockedTowers = [1,1,1]

#start at 0, go onto 1,2,3,4,5
@export var unlocked_levels: int=0

var loadthisdialogicscene: String = ""
 
func _ready():
	pass
	
func enemykilled(points):
	pp += points 
	enemiesdefeated +=1 
	if(beeper != null):
		get_tree().get_root().get_node("Lvl1Td/tdstuff/utilityorganizer/beepplayer").play()
	
	
func enemypassed():
	#print("enemypassed")
	corehp -=1 

func goNext(): 
	if(!checkbool):
		checkbool=true
		#await get_tree().create_timer(1.0).timeout
		get_tree().get_root().get_node("Lvl1Td/RPGBattle").visible = false
		
		get_tree().get_root().get_node("Lvl1Td/Leftsidetyping").visible = true
