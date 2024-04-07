extends Node


@export var pp: int = 20

@export var tddifficulty: int = 1

@export var tddamagemultiplier: int = 1

@export var corehp: int = 10

@export var enemiesdefeated=0 

func enemykilled(points):
	pp += points 
	enemiesdefeated +=1 
	
func enemypassed():
	print("enemypassed")
	corehp -=1 
