extends Node2D

@onready var captured_image: TextureRect = $GameplayScreenshot

# Called when the node enters the scene tree for the first time.
func _ready():
	load_screenshot()

func load_screenshot():
	captured_image.set_texture(Screenshots.get_screenshot_texture())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_restart_button_button_up():
	get_parent().get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")

func _on_main_menu_button_button_up():
	get_parent().get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
