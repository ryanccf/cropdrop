extends Node2D

var spawned_sound = "res://assets/Audio/impactSoft_heavy_000.ogg"

func _return_to_menu():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
func _process(delta):
	pass
	$Playfield/OutOfBounds/Area2D.get_overlapping_bodies().map(func(body):
		if(body.has_method("get_species") and not body.is_queued_for_deletion()):
			if(body.linear_velocity.snapped(Vector2(0.01, 0.01)) == Vector2.ZERO):
				_return_to_menu()
		)

func _on_vegetable_factory_spawned_vegetable():
	var the_sound = load(spawned_sound)
	if the_sound is AudioStream and Settings.is_muted() == false:
		$AudioStreamPlayer.stream = the_sound
		$AudioStreamPlayer.play()

func _on_menu_button_button_up():
	var settings_menu = load("res://settings_menu.tscn").instantiate()
	settings_menu.z_index = 10
	add_child(settings_menu)
