extends Node2D
@export var broccoli_scene: PackedScene = preload("res://broccoli.tscn")
@export var cabbage_scene: PackedScene = preload("res://cabbage.tscn")
@export var carrot_scene: PackedScene = preload("res://carrot.tscn")
@export var cauliflower_scene: PackedScene = preload("res://cauliflower.tscn")
@export var cucumber_scene: PackedScene = preload("res://cucumber.tscn")
@export var tomato_scene: PackedScene = preload("res://tomato.tscn")
@export var garlic_scene: PackedScene = preload("res://garlic.tscn")
@export var onion_scene: PackedScene = preload("res://onion.tscn")
@export var pepper_scene: PackedScene = preload("res://pepper.tscn")
@export var potato_scene: PackedScene = preload("res://potato.tscn")
@export var pumpkin_scene: PackedScene = preload("res://pumpkin.tscn")
@export var squash_scene: PackedScene = preload("res://squash.tscn")

var rng = RandomNumberGenerator.new()

var vegetable_size=2
var vegetable_scenes = [garlic_scene, potato_scene, tomato_scene, onion_scene, pepper_scene, carrot_scene, cucumber_scene, squash_scene, broccoli_scene, cabbage_scene, cauliflower_scene, pumpkin_scene]

var vegetable_queue = []
# Called when the node enters the scene tree for the first time.
func _ready():
	$VegetableChart.set_scenes(vegetable_scenes)
	add_vegetable()
	add_vegetable()
	set_indicators()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event.is_echo():
		return
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			spawn(get_global_mouse_position())

func set_indicators():
	$VegetableIndicatorB.set_texture(vegetable_scenes[vegetable_queue[-0]].instantiate().get_texture())
	$VegetableIndicatorA.set_texture(vegetable_scenes[vegetable_queue[-1]].instantiate().get_texture())

func spawn(spawn_global_position):
	spawn_vegetable(cycle_vegetable_queue(), Vector2(spawn_global_position.x, 0))
	set_indicators()

func spawn_vegetable(vegetable_index, spawn_global_position):
	var instance = vegetable_scenes[vegetable_index].instantiate()
	instance.global_position = spawn_global_position
	instance.on_merge(_bind_spawn_vegetable(_loop_index(vegetable_index+1)))
	check_win(vegetable_index)
	add_child(instance)
	
func check_win(vegetable_index):
	if vegetable_index + 2 > vegetable_scenes.size():
		show_win_label()
		get_tree().paused = true
		unpause_game()
	
	
		
func show_win_label():
	$WinLabel.visible = true
	
func unpause_game():
	await get_tree().create_timer(5.0).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _loop_index(next_index):
	return next_index if vegetable_scenes.size() > next_index else 0

func _bind_spawn_vegetable(vegetable_index):
	return func (spawn_global_position):
		spawn_vegetable(vegetable_index, spawn_global_position)

func cycle_vegetable_queue():
	add_vegetable()
	return vegetable_queue.pop_back()

func add_vegetable():
	vegetable_queue.push_front(choose_vegetable())

func choose_vegetable():
	var rando = rng.randi_range(1,100)
	var chosen_vegetable = 0
	if range(1,20).has(rando):
		chosen_vegetable = 0
	if range(21,45).has(rando):
			chosen_vegetable = 1
	if range(46,70).has(rando):
		chosen_vegetable = 2
	if range(71,90).has(rando):
			chosen_vegetable = 3
	if range(91,100).has(rando):
		chosen_vegetable = 4
	return chosen_vegetable
