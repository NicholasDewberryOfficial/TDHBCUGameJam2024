extends Button


var paused: bool = false
@export var children: Panel = null
func _on_pressed():
	get_tree().paused = !(get_tree().paused)
	self.paused = false
	pass # Replace with function body.

func _process(delta):
	if(get_tree().paused == true):
		children.visible = true
	else:
		children.visible = false
