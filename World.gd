extends Node2D

@onready var player: CharacterBody2D = $Player

@onready var camera_2d: Camera2D = $Camera2D
@onready var fragment_1: AudioStreamPlayer2D = $fragment1
@onready var fragment_2: AudioStreamPlayer2D = $fragment2
@onready var fragment_3: AudioStreamPlayer2D = $fragment3
@onready var fragment_4: AudioStreamPlayer2D = $fragment4
@onready var aud_intro: AudioStreamPlayer2D = $intro
@onready var final_ending: AudioStreamPlayer2D = $finalEnding


func _on_camera_up_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		camera_2d.base_zoom = Vector2(0.2, 0.2)
		camera_2d.reference_scale = Vector2(2.0, 2.0)
		print("player_entered!")


func _on_camera_up_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		camera_2d.base_zoom = Vector2(1.0, 1.0)
		camera_2d.reference_scale = Vector2(1.0, 1.0)
		print("player_exited!")


func _on_intro_body_entered(body: Node2D) -> void:
	print("intro BEGIN")
	aud_intro.play()


func _on_get_big_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("lumake")
		player.scale = Vector2(5.0, 5.0)
		
