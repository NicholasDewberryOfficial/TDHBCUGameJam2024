extends Node2D


@onready var rollerpath = preload("res://combined/stage2.tscn")
@onready var propellerpath = preload("res://combined/stage3.tscn")
@onready var crusherpath = preload("res://combined/stage4.tscn")
var rng = RandomNumberGenerator

func _ready():
	rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	var val = rng.randi_range(0,Globalvars.tddifficulty)
	#var val = 2
	match val:
		0:
			var tempPath = rollerpath.instantiate()
			add_child(tempPath)
		1:
			var tempPath = propellerpath.instantiate()
			add_child(tempPath)
		2: 
			var tempPath = crusherpath.instantiate()
			add_child(tempPath)
