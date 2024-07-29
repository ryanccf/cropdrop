extends Node2D

func _unhandled_key_input(event):
	if event.is_pressed():
		start_game()

func start_game():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_button_down():
	start_game()


func _on_texture_button_button_up():
	var settings_menu = load("res://settings_menu.tscn").instantiate()
	settings_menu.z_index = 10
	add_child(settings_menu)
