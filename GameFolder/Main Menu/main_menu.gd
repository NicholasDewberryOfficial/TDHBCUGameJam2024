extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://RPGStuff/RPGScene.tscn")

func _on_tutorial_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
