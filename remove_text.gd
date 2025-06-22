extends Area2D

@export var shrink_duration: float = 5.0  # seconds until gone

var shrinking: bool = false
var shrink_timer: float = 0.0
var original_font_size: int = 24  # set to your font size

@onready var label := $RichTextLabel
@onready var dynamic_font := label.get("theme_override_fonts/normal_font")

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	if dynamic_font:
		original_font_size = dynamic_font.size

func _on_body_entered(body):
	if body.name == "Player":
		shrinking = true

func _process(delta):
	if shrinking and dynamic_font:
		shrink_timer += delta
		var t := clamp(1.0 - (shrink_timer / shrink_duration), 0.0, 1.0)
		var new_size := max(1, int(original_font_size * t))  # prevent size 0 crash
		dynamic_font.size = new_size
		if t <= 0.0:
			queue_free()
