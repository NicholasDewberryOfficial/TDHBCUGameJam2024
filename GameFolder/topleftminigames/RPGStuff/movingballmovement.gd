extends CharacterBody2D


# Called when the node enters the scene tree for the first time.

# Gravity and speed variables
@export var gravity: float = 600.0
@export var fall_speed: float = 1000.0
@export var bounce_speed: float = 600.0


func _ready():
	# Initialize the velocity
	velocity = Vector2(0, fall_speed)

func _physics_process(delta):
	# Apply gravity
	velocity.y += gravity * delta

	# Move the object
	move_and_slide()

	# Check for collisions and switch direction if needed
	if is_on_floor() or is_on_wall():
		_switch_direction()

func _switch_direction():
	# Reverse the vertical direction
	velocity.y = -bounce_speed

