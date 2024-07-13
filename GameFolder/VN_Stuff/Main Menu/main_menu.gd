extends Control

#@export var thisnodepath: NodePath = null
func _on_start_pressed():
	get_tree().change_scene_to_file("res://VN_Stuff/IntroCutscene/newintro/newintrocutscene.tscn")

func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	pass # Replace with function body.


func _on_load_pressed():
	pass # Replace with function body.
