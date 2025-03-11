extends Control

# Scenes
const EASY_LVL = preload("res://Scenes/easy_lvl.tscn")

# Panels
@onready var main_screen: VBoxContainer = $Panel/mainScreen
@onready var level_selection: VBoxContainer = $Panel/levelSelection


# Main Menu
@onready var start_btn: Button = $Panel/VBoxContainer/HBoxContainer/startBtn
@onready var quit_btn: Button = $Panel/VBoxContainer/HBoxContainer/quitBtn


# Diffuclty levels buttons
@onready var easy_mode: Button = $Panel/VBoxContainer2/HBoxContainer/easyMode
@onready var medium_mode: Button = $Panel/VBoxContainer2/HBoxContainer/mediumMode
@onready var hard_mode: Button = $Panel/VBoxContainer2/HBoxContainer/hardMode



func _ready() -> void:
	level_selection.hide()
	main_screen.show()
	GLOBAL.money = 0
	


# Difficulty change scene when selected
func _on_easy_mode_pressed() -> void:
	get_tree().change_scene_to_packed(EASY_LVL)

func _on_medium_mode_pressed() -> void:
	get_tree().change_scene_to_packed(EASY_LVL)

func _on_hard_mode_pressed() -> void:
	get_tree().change_scene_to_packed(EASY_LVL)


# Main Screen buttons
func _on_start_btn_pressed() -> void:
	level_selection.show()
	main_screen.hide()


func _on_quit_btn_pressed() -> void:
	pass # Replace with function body.
