extends Node2D
@export var vegetable_scene: PackedScene = preload("res://vegetable.tscn")

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
	var instance = vegetable_scene.instantiate()
	instance.global_position = Vector2(spawn_global_position.x, 0)
	#instance.global_position = spawn_global_position
	add_child(instance)
