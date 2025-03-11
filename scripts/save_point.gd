extends Area2D
@onready var level_complete: CanvasLayer = $"../../../LevelComplete"


var level_mode:int = 1

func _ready() -> void:
	level_complete.hide()

func _on_body_entered(body: Node2D) -> void:
	GLOBAL.update_level.emit()
	GLOBAL.level += level_mode
	
	print("Player saved!")
	level_complete.show()
