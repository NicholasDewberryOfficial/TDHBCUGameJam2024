extends Node2D


@onready var rollerpath = preload("res://combined/stage2.tscn")
var rng = RandomNumberGenerator

func _ready():
	rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	var val = rng.randi_range(0,Globalvars.tddifficulty)
	match val:
		0:
			var tempPath = rollerpath.instantiate()
			add_child(tempPath)
