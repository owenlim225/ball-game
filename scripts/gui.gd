extends CanvasLayer

@onready var money_count: Label = $MarginContainer/MoneyCount



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GLOBAL.connect("update_money", update_money)
	money_count.text = "0"

func update_money() -> void:
	money_count.text = str(GLOBAL.money)
