extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$statspanel/pplabel.text = "PP: " + str(Globalvars.pp)
	$statspanel/enemiesdefeatedlabel.text = "Enemies defeated: " + str(Globalvars.enemiesdefeated)
	$statspanel/corehp.text = "corehp: " + str(Globalvars.corehp)
	pass


func _on_increase_tower_damage_pressed():
	if(Globalvars.pp - 150 < 0):
		pass
	else:
		Globalvars.pp -=150
		Globalvars.tddamagemultiplier += 1 



func _on_myrtle_dmg_up_pressed():
	if(Globalvars.pp - 150 < 0):
		pass
	else:
		Globalvars.pp -=150
		Globalvars.mdmg += 1 
	pass # Replace with function body.


func _on_increase_core_hp_pressed():
	if(Globalvars.pp - 150 < 0):
		pass
	else:
		Globalvars.pp -=150
		Globalvars.corehp += 1 
	pass # Replace with function body.


func _on_myrtle_hp_up_pressed():
	Globalvars.increaseMtlHP = true
	pass # Replace with function body.
