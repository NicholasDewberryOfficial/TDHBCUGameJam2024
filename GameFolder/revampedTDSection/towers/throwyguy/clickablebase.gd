extends Area2D

@export var type: int =0

#we pass a reference to THE NODE2D ITSELF
#then we modify the variable, so we don't go to the node directly, instead we have an intermedate.
@export var mytowerattackvariables = Node2D
# 1= ham girl, 2=throwguy 3 = longarm #4 = slowing cactus =aoedamagecactus


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton && event.pressed):
		#print("PLAYER PRESSED ME")
		var thisnode: Control = get_tree().get_first_node_in_group("towerupgradesnodegroup")
		thisnode.currentlyselectedType = type
		thisnode.currentattackscript = mytowerattackvariables
	pass # Replace with function body.
