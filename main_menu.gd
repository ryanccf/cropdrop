extends Node2D

func _unhandled_key_input(event):
	if event.is_pressed():
		start_game()

func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		start_game()

func start_game():
	if not $StartTime.get_time_left() > 0:
		get_tree().change_scene_to_file("res://main.tscn")
