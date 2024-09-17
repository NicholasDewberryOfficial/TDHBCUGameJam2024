extends Node2D
@export var initialconotrol: Control
@export var secondarycontrol: Control
var showthisvar = true

func _process(delta):
	if(showthisvar):
		initialconotrol.visible = true
		secondarycontrol.visible = false
	else:
		initialconotrol.visible = false
		secondarycontrol.visible = true

func _on_gameintrocutscene_pressed():
	Globalvars.loadthisdialogicscene = "NewIntro"
	get_tree().change_scene_to_file("res://VN_Stuff/BasicVNLoader.tscn")
	pass # Replace with function body.


func _on_snipercactusscene_pressed():
	Globalvars.loadthisdialogicscene = "cactussniper1"
	get_tree().change_scene_to_file("res://VN_Stuff/BasicVNLoader.tscn")
	pass # Replace with function body.



func _on_aoeslowcactusscene_pressed():
	Globalvars.loadthisdialogicscene = "slowervine1timeline"
	get_tree().change_scene_to_file("res://VN_Stuff/BasicVNLoader.tscn")
	pass # Replace with function body.


func _on_hammergiirlscene_pressed():
	Globalvars.loadthisdialogicscene = "hammergirl1timeline"
	get_tree().change_scene_to_file("res://VN_Stuff/BasicVNLoader.tscn")
	pass # Replace with function body.
	


func _on_bombthrowercactusscene_pressed():
	Globalvars.loadthisdialogicscene = "bombthrowertimeline"
	get_tree().change_scene_to_file("res://VN_Stuff/BasicVNLoader.tscn")
	pass # Replace with function body.


func _on_boss_encounter_1_pressed():
	Globalvars.loadthisdialogicscene = "BossRobot1"
	get_tree().change_scene_to_file("res://VN_Stuff/BasicVNLoader.tscn")
	pass # Replace with function body.


func _on_boss_encounter_2_pressed():
	Globalvars.loadthisdialogicscene="BossRobot2"
	get_tree().change_scene_to_file("res://VN_Stuff/BasicVNLoader.tscn")
	pass # Replace with function body.


func _on_morecactuscalvary_pressed():
	showthisvar = false
	pass # Replace with function body.


func _on_backtomainmenu_pressed():
	showthisvar = true
	pass # Replace with function body.
