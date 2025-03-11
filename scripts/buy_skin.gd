extends Control
const TITLE_SCREEN = preload("res://scenes/title_screen.tscn")
@onready var money_count: Label = $MoneyCount


func _on_exit_shop_btn_pressed() -> void:
	get_tree().change_scene_to_packed(TITLE_SCREEN)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GLOBAL.connect("update_money", update_money)


func update_money() -> void:
	money_count.text = str(GLOBAL.money)
