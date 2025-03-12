extends Node2D



func _ready() -> void:
	UIMANAGER.gui.show()
	


func _on_save_point_body_entered(body: Node2D) -> void:
	print("Player saved!")
	UIMANAGER.level_complete.show()
	
	GLOBAL.hard = true
