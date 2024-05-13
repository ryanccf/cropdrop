extends "res://vegetable.gd"

@export var next_fruit_scene: PackedScene = preload("res://garlic.tscn")

func _ready():
	species = "Tomato"
	super._ready()

#func spawn_next_fruit():
#	super.spawn_next_fruit()
#	var instance = next_fruit_scene.instantiate()
#	print("INSTANTIATE IS NOT A NULL VALUE")
#	print(instance)
#	instance.global_position = global_position
#	get_parent().add_child(instance)
	
