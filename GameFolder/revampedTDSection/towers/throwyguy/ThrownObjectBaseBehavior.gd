extends Area2D

#NO
@export var damage: float 
var speed = 500
@export var thissound: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if($dmgtimer.is_stopped()):
		queue_free()
	pass

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_area_entered(area):
	#print(area.name)
	#print(area.get_script())
	#if(area.is_in_group("enemyhitboxgroup") and area.has_method("takedamage")):
		#area.takedamage(damage)
	if(area.is_in_group("enemyhitboxgroup") and area.has_method("takedamage")):
		area.takedamage(damage)
		var thesesounds = thissound.instantiate()		
		get_tree().root.add_child(thesesounds)
		queue_free()
	pass # Replace with function body.
