extends CharacterBody2D

@export var speed: float = 500.0
@export var max_speed: float = 1000.0
@export var acceleration: float = 25.0
@export var friction: float = 5.0
@export var jump_velocity: float = -900.0
@export var rotation_speed: float = 5.0
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var start_x: float = 0.0
@export var end_x: float = 1000.0
@export var start_scale: Vector2 = Vector2(0.5, 0.5)
@export var end_scale: Vector2 = Vector2(1.0, 1.0)

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Movement
	var direction := Input.get_axis("left", "right")

	if direction:
		speed = min(speed + acceleration, max_speed)
		velocity.x = direction * speed
	else:
		speed = 0
		velocity.x = move_toward(velocity.x, 0, friction)

	# Rotation (like a rolling ball)
	if velocity.x != 0:
		rotation += sign(velocity.x) * rotation_speed * (abs(velocity.x) / max_speed) * delta

	move_and_slide()

func _process(delta: float) -> void:
	var t: float = clamp((global_position.x - start_x) / (end_x - start_x), 0.0, 1.0)
	scale = start_scale.lerp(end_scale, t)
