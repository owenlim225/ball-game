extends CanvasLayer

func _ready() -> void:
	self.hide()

@onready var shop: CanvasLayer = $"../shop"
const TITLE_SCREEN = preload("res://scenes/title_screen.tscn")


func _on_mainmenu_btn_pressed() -> void:
	var title_screen = load("res://scenes/title_screen.tscn") as PackedScene
	if TITLE_SCREEN:
		UIMANAGER.level_complete.hide()
		UIMANAGER.gui.hide()
		get_tree().change_scene_to_packed(title_screen)
	else:
		push_error("TITLE_SCREEN scene is missing!")

func _on_buyskin_btn_pressed() -> void:
	shop.show()
	UIMANAGER.level_complete.hide()
