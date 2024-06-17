extends Area2D

@export var damage: float  =3

# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.restart()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($dmgtimer.is_stopped()):
		queue_free()


func _on_area_entered(area):
	#This is on the hitbox itself. if it hits an enemy, have the enemy take damage.
	if(area.is_in_group("enemyhitboxgroup") and area.has_method("takedamage")):
		area.takedamage(damage)
	
