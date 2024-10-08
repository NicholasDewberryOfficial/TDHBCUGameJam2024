extends Area2D

var damage: float  = 2
@export var newcurve = Gradient

# Called when the node enters the scene tree for the first time.
func _ready():
	#$CPUParticles2D.restart()
	#print(str($CPUParticles2D.emitting))
	if(damage == 3):
		$CPUParticles2D.color_ramp = newcurve
	$CPUParticles2D.emitting = true
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($dmgtimer.is_stopped()):
		queue_free()


func _on_area_entered(area):
	#This is on the hitbox itself. if it hits an enemy, have the enemy take damage.
	if(area.is_in_group("enemyhitboxgroup") and area.has_method("takedamage")):
		area.takedamage(damage)
	
