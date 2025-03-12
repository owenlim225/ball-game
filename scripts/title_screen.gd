extends Control

# Scenes
const EASY_LVL = preload("res://Scenes/easy_lvl.tscn")
const MEDIUM_LVL = preload("res://scenes/mid_lvl.tscn")
#const HARD_LVL = preload("res://scenes/hard_level.tscn")

# Panels
@onready var main_screen: VBoxContainer = $Panel/mainScreen
@onready var level_selection: VBoxContainer = $Panel/levelSelection

# Main Menu Buttons
@onready var start_btn: Button = $Panel/mainScreen/HBoxContainer/startBtn
@onready var quit_btn: Button = $Panel/mainScreen/HBoxContainer/quitBtn

# Difficulty Level Buttons
@onready var easy_mode: Button = $Panel/levelSelection/HBoxContainer/easyMode
@onready var medium_mode: Button = $Panel/levelSelection/HBoxContainer/mediumMode
@onready var hard_mode: Button = $Panel/levelSelection/HBoxContainer/hardMode

func _ready() -> void:
	main_screen.show()
	level_selection.hide()
	
	call_deferred("update_buttons")  # Ensure UI updates properly

func update_buttons() -> void:
	easy_mode.disabled = !GLOBAL.easy
	medium_mode.disabled = !GLOBAL.medium
	hard_mode.disabled = !GLOBAL.hard

	print("Easy Mode Disabled:", easy_mode.disabled)
	print("Medium Mode Disabled:", medium_mode.disabled)
	print("Hard Mode Disabled:", hard_mode.disabled)

# Difficulty Selection
func _on_easy_mode_pressed() -> void:
	if GLOBAL.easy:
		get_tree().change_scene_to_packed(EASY_LVL)

func _on_medium_mode_pressed() -> void:
	if GLOBAL.medium:
		get_tree().change_scene_to_packed(MEDIUM_LVL)
#
#func _on_hard_mode_pressed() -> void:
	#if GLOBAL.hard:
		#get_tree().change_scene_to_packed(HARD_LVL)

# Main Menu Actions
func _on_start_btn_pressed() -> void:
	main_screen.hide()
	level_selection.show()

func _on_quit_btn_pressed() -> void:
	get_tree().quit()  # Exit game properly
