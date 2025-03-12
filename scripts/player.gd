extends CharacterBody2D


var speed = 0

const MAX_SPEED = 250
const ACCELERATION = 1.5

const JUMP_VELOCITY = -300.0

const FRICTION = 70
const ROTATION_SPEED = 5

func _physics_process(delta: float) -> void:
	var collision = move_and_slide()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction:
		speed = min(speed + ACCELERATION, MAX_SPEED)
		velocity.x = direction * speed
	else:
		speed = 0
		velocity.x = move_toward(velocity.x, 0, speed)
	
	# Rotate player like a ball
	if velocity.x != 0:
		rotation += sign(velocity.x) * ROTATION_SPEED * (abs(velocity.x) / MAX_SPEED) * delta
		
	move_and_slide()


func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
