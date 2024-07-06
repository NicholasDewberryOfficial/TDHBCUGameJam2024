extends Control

#@export var thisnodepath: NodePath = null
func _on_start_pressed():
	get_tree().change_scene_to_file("res://IntroCutscene/IntroCutscene.tscn")

func _on_tutorial_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
