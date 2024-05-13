extends Node2D
@export var tomato_scene: PackedScene = preload("res://tomato.tscn")
@export var garlic_scene: PackedScene = preload("res://garlic.tscn")
@export var onion_scene: PackedScene = preload("res://onion.tscn")
var vegetable_scenes = [tomato_scene, garlic_scene, onion_scene]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event.is_echo():
		return
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			spawn(get_global_mouse_position())

func spawn(spawn_global_position):
	spawn_vegetable(0, Vector2(spawn_global_position.x, 0))

func spawn_vegetable(vegetable_index, spawn_global_position):
	var instance = vegetable_scenes[vegetable_index].instantiate()
	instance.global_position = spawn_global_position
	instance.on_merge(_bind_spawn_vegetable(_loop_index(vegetable_index+1)))
	add_child(instance)

func _loop_index(next_index):
	return next_index if vegetable_scenes.size() > next_index else 0

func _bind_spawn_vegetable(vegetable_index):
	return func (spawn_global_position):
		spawn_vegetable(vegetable_index, spawn_global_position)

#func spawn_tomato(spawn_global_position):
#	var instance = tomato_scene.instantiate()
#	instance.global_position = spawn_global_position
#	instance.set_duplication_event(spawn_garlic)
#	add_child(instance)

#func spawn_garlic(spawn_global_position):
#	var instance = garlic_scene.instantiate()
#	instance.global_position = Vector2(spawn_global_position.x, spawn_global_position.y)
#	#instance.global_position = spawn_global_position
#	instance.set_duplication_event(spawn_tomato)
#	add_child(instance)
