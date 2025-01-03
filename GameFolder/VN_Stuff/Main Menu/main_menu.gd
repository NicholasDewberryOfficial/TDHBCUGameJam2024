extends Control

@export var mainbuttonpanel: Container
@export var aboutusbutton: Button	

@export var aboutuspanel: Panel

#@export var thisnodepath: NodePath = null
func _on_start_pressed():
	get_tree().change_scene_to_file("res://VN_Stuff/IntroCutscene/newintro/newintrocutscene.tscn")

func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	pass # Replace with function body.


func _on_load_pressed():
	pass # Replace with function body.


func _on_about_us_pressed() -> void:
	mainbuttonpanel.hide()
	aboutusbutton.hide()
	aboutuspanel.show()
	pass # Replace with function body.


func _on_back_to_main_pressed() -> void:
	aboutuspanel.hide()
	aboutusbutton.show()
	mainbuttonpanel.show()
	pass # Replace with function body.
