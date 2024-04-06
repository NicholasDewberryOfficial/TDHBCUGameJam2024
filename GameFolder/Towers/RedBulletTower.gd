extends StaticBody2D


var Bullet = preload("res://Towers/bullet.tscn")
var bulletDamage = 5
var pathName 
var currTargets = []
var curr
var tempArray = []

func _process(delta):
    if is_instance_valid(curr):
       self.look_at(curr.global_position) 
    else:
        for i in get_node("Bulletcontainer").get_child_count():
            get_node("Bulletcontainer").get_child(i).queue_free()


func _on_tower_body_entered(body):
    if "main_character" in body.name:
        var tempArray = []
        currTargets = get_node("Towers").get_overlapping_bodies()
        for i in currTargets:
            if "main" in i.name:
                tempArray.append(i)
            
            @warning_ignore("shadowed_variable", "unused_variable")
            var currTargets = null
       
    for i in tempArray:
        if currTargets == null:
            currTargets = i.get_node("../") 
        else:
            if i.get_parent().get_progrss() > currTargets.get_progrss():
                currTargets = i.get_node("../")
        curr = currTargets     
        pathName = currTargets.get_parent().name
        var tempBullet = Bullet.instantiate()
        tempBullet.pathName = pathName
        tempBullet.bulletDamage = bulletDamage
        get_node("Bulletcontainer").add_child(tempBullet)
        tempBullet.global_position = $Aim.global_position
        
       
@warning_ignore("unused_parameter")
func _on_tower_body_exited(body):
    currTargets = get_node("Tower").get_overlapping_bodies()
