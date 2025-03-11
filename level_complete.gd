extends CanvasLayer

@onready var level_complete: CanvasLayer = $"."

const TITLE_SCREEN = preload("res://scenes/title_screen.tscn")
const BUY_SKIN = preload("res://scenes/buy_skin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_complete.hide()



func _on_buyskin_btn_pressed() -> void:
	get_tree().change_scene_to_packed(BUY_SKIN)


func _on_mainmenu_btn_pressed() -> void:
	get_tree().change_scene_to_packed(TITLE_SCREEN)
