extends StaticBody2D

var Bullet = preload("res://tdstuff/towers/redbullet.tscn")
var bulletdamage = 5
var pathName 
var currTargets = []
var curr

func _physics_process(delta):
	if is_instance_valid(curr):
		self.look_at(curr.global_position)

func _on_tower_body_entered(body):
	if "bot" in body.name:
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()
		#print(currTargets)
		for i in currTargets:
			if "bot" in i.name:
				tempArray.append(i)
				
		var currTarget = null
		
		for i in tempArray:
			if currTarget ==null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
					
		curr = currTarget
		pathName = currTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletdamage
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position
		
func _on_tower_body_exited(body):
	currTargets = get_node("Tower").get_overlapping_bodies()
	
	pass # Replace with function body.
