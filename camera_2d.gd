extends Camera2D

@export var zone_size: Vector2 = Vector2(1280, 720) # size of one "screen" or section
@export var base_zoom: Vector2 = Vector2(1.0, 1.0)
@export var reference_scale: Vector2 = Vector2(1.0, 1.0)
@export var zoom_multiplier: float = 1.0

@onready var player: CharacterBody2D = $"../Player"

func _process(delta: float) -> void:
	# ======= Zone-based Camera Movement =======
	var player_pos := player.global_position
	var zone_index := Vector2i(
		int(floor(player_pos.x / zone_size.x)),
		int(floor(player_pos.y / zone_size.y))
	)

	var target_position := Vector2(
		zone_index.x * zone_size.x + zone_size.x / 2,
		zone_index.y * zone_size.y + zone_size.y / 2
	)

	global_position = global_position.lerp(target_position, 10.0 * delta)

	# ======= Zoom Based on Player Scale =======
	var scale_ratio: Vector2 = Vector2(
		player.scale.x / reference_scale.x,
		player.scale.y / reference_scale.y
	)

	var inverse_scale: Vector2 = Vector2(
		1.0 / scale_ratio.x,
		1.0 / scale_ratio.y
	)

	var target_zoom: Vector2 = base_zoom * inverse_scale * zoom_multiplier

	zoom = zoom.lerp(target_zoom, 5.0 * delta)
