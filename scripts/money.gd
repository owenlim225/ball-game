extends Area2D

@export var value:int = 1

func _on_body_entered(body: Node2D) -> void:
	GLOBAL.money += value
	GLOBAL.update_money.emit()
	
	print("You picked a money.\n")
	print("Current money:", GLOBAL.money)
	print()
	queue_free()
