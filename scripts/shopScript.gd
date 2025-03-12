extends CanvasLayer


const TITLE_SCREEN = preload("res://scenes/title_screen.tscn")
@onready var money_count: Label = $MoneyCount



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GLOBAL.connect("update_money", update_money)
	money_count.text = str(GLOBAL.money)


func update_money() -> void:
	money_count.text = str(GLOBAL.money)


func _on_exit_shop_btn_pressed() -> void:
	self.hide()
	UIMANAGER.level_complete.show()
