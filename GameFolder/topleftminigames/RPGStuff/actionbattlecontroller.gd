extends Node

@export var goalball: Sprite2D
@export var movingball: CharacterBody2D
@export var curremy: emyres
@export var basedamage: float = .07

func _physics_process(delta):
	if(Input.is_action_just_pressed("Q")):
		attackfunction()
		pass
	pass
	
func attackfunction():
	runplayerdamage()
	runenemydamage()
	
func runplayerdamage(): 
	var damagemod = 300 - movingball.position.distance_to(goalball.position)
	var curdmg = basedamage*damagemod
	curremy.health -= (curdmg)
	$bgpanel/EnemyPanel/emydmgpopup/textbg/emydmgtext.text = "Takes: " + str(snapped(curdmg,1))
	$bgpanel/EnemyPanel/emydmgpopup.play("NormDamage")
	
func runenemydamage(): 
	
	pass
	
