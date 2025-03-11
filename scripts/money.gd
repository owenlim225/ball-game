extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("You picked a money.\n")
	GLOBAL.money += 1
	print("Current money:", GLOBAL.money)
	print()
