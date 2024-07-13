extends Path2D

@export var myfollow: PathFollow2D
@export var speed = 500
func _ready():
	pass

func _physics_process(delta):
	myfollow.progress += (delta * speed)

