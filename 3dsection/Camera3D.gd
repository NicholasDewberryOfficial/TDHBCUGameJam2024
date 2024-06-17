extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    rotation.x = clamp(rotation.x,-1,1)
    
func _input(event):
    if event is InputEventMouseMotion:
        rotate(Vector3.UP, event.relative.y * 0.001)
        rotate_object_local(Vector3.RIGHT,event.relative.x* 0.001)
