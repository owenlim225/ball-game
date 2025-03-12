extends CanvasLayer

@onready var shop: CanvasLayer = $shop
@onready var level_complete: CanvasLayer = $LevelComplete
@onready var gui: CanvasLayer = $GUI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shop.hide()
	level_complete.hide()
	gui.hide()
