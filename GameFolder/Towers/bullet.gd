extends CharacterBody2D

var target 
var speed = 1000
var pathName = " "
var bulletDamage

@warning_ignore("unused_parameter")
func _physics_process(delta):
    
    var PathSpawnerNode = get_tree().get_root().get_node("Main/PathSpawner")
    for i in PathSpawnerNode.get_child_count():
        if PathSpawnerNode.get_child(i).name == pathName:
            target = PathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
            
    velocity = global_position.direction_to(target) * speed
    
    look_at(target)
    
    move_and_slide()

func _on_area_2d_body_entered(body):
    if "main_character" in body.name:
        body.Health -= bulletDamage
        queue_free()
