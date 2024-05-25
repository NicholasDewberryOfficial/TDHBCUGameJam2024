extends Area2D

@export var damage: float  =3

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($dmgtimer.is_stopped()):
		queue_free()
	pass


func _on_area_entered(area):
	#print(area.name)
	#print(area.get_script())
	#if(area.is_in_group("enemyhitboxgroup") and area.has_method("takedamage")):
		#area.takedamage(damage)
	if(area.is_in_group("enemyhitboxgroup") and area.has_method("takedamage")):
		area.takedamage(damage)
	pass # Replace with function body.
