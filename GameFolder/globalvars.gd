extends Node


@export var pp: int = 100

@export var tddifficulty: int = 0

@export var tddamagemultiplier: int = 1
	
@export var corehp: int = 10

@export var enemiesdefeated=0 

@export var mdmg: int = 1

@export var checkbool: bool = false


func _ready():
	tddifficulty = 0
	await get_tree().create_timer(90.0).timeout
	tddifficulty = 1
	await get_tree().create_timer(90.0).timeout
	tddifficulty = 2
	
func enemykilled(points):
	pp += points 
	enemiesdefeated +=1 
	get_tree().get_root().get_node("localized/DesertTDscene/beep").play()
	
	
func enemypassed():
	print("enemypassed")
	corehp -=1 

func goNext(): 
	if(!checkbool):
		checkbool=true
		#await get_tree().create_timer(1.0).timeout
		get_tree().get_root().get_node("localized/RPGBattle").visible = false
		get_tree().get_root().get_node("localized/Leftsidetyping").visible = true
