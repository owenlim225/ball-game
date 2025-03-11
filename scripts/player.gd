extends CharacterBody2D


const SPEED = 10.0
const JUMP_VELOCITY = -30.0

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
	
	# Rotate player like a ball
	rotation += direction * ROTATION_SPEED * delta
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
