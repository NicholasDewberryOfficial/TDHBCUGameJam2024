extends Node

#THIS FILE IS ONLY FOR CHANGING SCENES THROUGH DIALGOIC!!!
#HAVE THE SCENETREE CHANGE THROUGH SCRIPTS, NOT THROUGH THIS SINGLETON

func okswitchscene(tothisone: String):
	get_tree().change_scene_to_file(str(tothisone))
	
