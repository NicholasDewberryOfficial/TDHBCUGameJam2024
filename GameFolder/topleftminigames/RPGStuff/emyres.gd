extends Resource

class_name emyres

#@export var name 
@export var name: String
@export var picture: Texture2D
@export var damage: int
@export var health: int 
@export var points: int 
#defences [0] = bash attack
#[1] = poke attack 
#[2] and on are left open

#so if defences[0] = 0 no change
#defences[1] = weakness (double damage) 
#defences[2] = resistance (half damage)
@export var defences: Array[int]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
