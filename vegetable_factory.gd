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

@export var sparkle_scene: PackedScene = preload("res://sparkle.tscn")

#G Major
var notes = [1.05946, 1.12246, 1.25992, 1.33484, 1.49831, 1.58457, 2.0, 2.11892, 2.24492, 2.51984, 2.66968, 2.99662, 3.16914, 4.0, 4.23784, 4.48984, 5.03968, 5.33936, 5.99324, 6.33828, 8.0, 8.47568, 8.97968, 10.07936, 10.67872, 11.98648, 12.67656]

const VEGETABLE_SPAWN_HEIGHT = 25

var rng = RandomNumberGenerator.new()

var vegetable_size=2
var vegetable_scenes = [garlic_scene, potato_scene, tomato_scene, onion_scene, pepper_scene, carrot_scene, cucumber_scene, squash_scene, broccoli_scene, cabbage_scene, cauliflower_scene, pumpkin_scene]
var vegetable_queue = []
var start_time = 0
var merged_sound = "res://assets/Audio/impactSoft_heavy_000.ogg"
var combo = 0
var just_spawned_vegetable = false

signal spawned_vegetable
signal merged_vegetable

func _ready():
	$VegetableChart.set_scenes(vegetable_scenes)
	add_vegetable()
	add_vegetable()
	set_indicators()
	start_time = Time.get_unix_time_from_system()

func _process(delta):
	pass

func _unhandled_input(event):
	if event.is_echo():
		return
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			drop(get_global_mouse_position())

func set_indicators():
	$VegetableIndicatorB.set_texture(vegetable_scenes[vegetable_queue[-0]].instantiate().get_texture())
	$VegetableIndicatorA.set_texture(vegetable_scenes[vegetable_queue[-1]].instantiate().get_texture())

func drop(spawn_global_position):
	spawned_vegetable.emit()
	spawn_vegetable(cycle_vegetable_queue(), Vector2(spawn_global_position.x, 0))
	spawn_sparkle(Vector2(spawn_global_position.x, 0))
	set_indicators()

func spawn_sparkle(spawn_global_position):
	var instance = sparkle_scene.instantiate()
	instance.global_position = spawn_global_position
	instance.position.y += VEGETABLE_SPAWN_HEIGHT
	add_child(instance)

func spawn_vegetable(vegetable_index, spawn_global_position):
	var instance = vegetable_scenes[vegetable_index].instantiate()
	instance.global_position = spawn_global_position
	instance.position.y += VEGETABLE_SPAWN_HEIGHT
	instance.on_merge(_bind_spawn_vegetable(_loop_index(vegetable_index+1)))
	check_win(vegetable_index)
	add_child(instance)
	spawn_sparkle(spawn_global_position)

func check_win(vegetable_index):
	if vegetable_index + 2 > vegetable_scenes.size():
		show_win_label()
		get_tree().paused = true
		unpause_game()

func show_win_label():
	$WinLabel.visible = true
	$TimeLabel.visible = true
	$TimeLabel.text = Time.get_time_string_from_unix_time(Time.get_unix_time_from_system() - start_time)

func unpause_game():
	await get_tree().create_timer(5.0).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _loop_index(next_index):
	return next_index if vegetable_scenes.size() > next_index else 0

func _bind_spawn_vegetable(vegetable_index):
	return func (spawn_global_position):
		$ComboTimer.start()
		combo += 1
		play_merge_sound()
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

func play_merge_sound():
	if Settings.is_muted() == false:
		var the_sound
		if combo < notes.size():
			$AudioStreamPlayer.pitch_scale = notes[combo]
		the_sound = load(merged_sound)
		if the_sound is AudioStream:
			$AudioStreamPlayer.stream = the_sound
			$AudioStreamPlayer.play()

func _on_combo_timer_timeout():
	just_spawned_vegetable = false
	combo = 0
