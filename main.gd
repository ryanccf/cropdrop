extends Node2D

func _return_to_menu():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
func _process(delta):
	pass
	$Playfield/OutOfBounds/Area2D.get_overlapping_bodies().map(func(body):
		if(body.has_method("get_species") and not body.is_queued_for_deletion()):
			if(body.linear_velocity.snapped(Vector2(0.01, 0.01)) == Vector2.ZERO):
				_return_to_menu()
		)
