extends Control

# Scenes
const EASY_LVL = preload("res://Scenes/easy_lvl.tscn")
const HARD_LVL = preload("res://scenes/hard_level.tscn")
const MEDIUM_LVL = preload("res://scenes/medium_lvl.tscn")
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

var money:int = 0
var level:int = 1

func _ready() -> void:
	level_selection.hide()
	main_screen.show()
	money = GLOBAL.money
	level = GLOBAL.level
	
	easy_mode.disabled = level < 1
	medium_mode.disabled = level < 2
	hard_mode.disabled = level < 3
	
	
	
func _on_easy_mode_pressed() -> void:
	if level >= 1 and EASY_LVL:
		get_tree().change_scene_to_packed(EASY_LVL)

func _on_medium_mode_pressed() -> void:
	if level >= 2 and MEDIUM_LVL:
		get_tree().change_scene_to_packed(MEDIUM_LVL)

func _on_hard_mode_pressed() -> void:
	if level >= 3 and HARD_LVL:
		get_tree().change_scene_to_packed(HARD_LVL)


# Main Screen buttons
func _on_start_btn_pressed() -> void:
	level_selection.show()
	main_screen.hide()


func _on_quit_btn_pressed() -> void:
	pass # Replace with function body.
