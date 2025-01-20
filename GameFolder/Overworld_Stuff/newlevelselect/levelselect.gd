extends Node2D

func _ready() -> void:
	if(MenuAnd3dSectionBackgroundMusic.playing == false):
		MenuAnd3dSectionBackgroundMusic.play()
	pass
