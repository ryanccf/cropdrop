extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_tree().paused = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_texture_button_button_up():
	get_parent().get_tree().paused = false
	queue_free()

func _on_menu_button_button_down():
	$Header/Popup.visible = true

func _on_confirm_button_button_up():
	get_parent().get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_button_button_up():
	$Header/Popup.visible = false
