extends CharacterBody3D
const SPEED = 5.0
const MOUSE_SENS = 0.2

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * MOUSE_SENS

func _process(delta):
	#if Input.is_action_just_pressed("exit"):
	#	get_tree().quit()
	pass

func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	velocity.y -= 9.8 * delta 
	get_input(delta)
	
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	var move = Input.get_axis("back", "forward")
	var turn = Input.get_axis("right", "left")
	velocity += -transform.basis.z * move * SPEED
	rotate_y(MOUSE_SENS * turn * delta)
	velocity.y = vy
