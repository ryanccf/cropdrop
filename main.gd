extends Node2D

var spawned_sound = "res://assets/Audio/impactSoft_heavy_000.ogg"

var song_1 = "res://assets/Audio/Podington_Bear_-_01_-_Happiness_Is.ogg"
var song_2 = "res://assets/Audio/Podington_Bear_-_02_-_The_Pigeon_Strut.ogg"
var song_3 = "res://assets/Audio/Podington_Bear_-_03_-_Herbie.ogg"
var song_4 = "res://assets/Audio/Podington_Bear_-_04_-_Breezin.ogg"
var song_5 = "res://assets/Audio/Podington_Bear_-_05_-_Twinkie.ogg"
var song_6 = "res://assets/Audio/Podington_Bear_-_06_-_Jazzer_Incisors.ogg"
var song_7 = "res://assets/Audio/Podington_Bear_-_07_-_Sneaker_Chase.ogg"
var song_8 = "res://assets/Audio/Podington_Bear_-_08_-_Falcon_Hood.ogg"
var song_9 = "res://assets/Audio/Podington_Bear_-_09_-_Operatives.ogg"
var song_10 = "res://assets/Audio/Podington_Bear_-_10_-_Mutinee.ogg"
var song_11 = "res://assets/Audio/Podington_Bear_-_11_-_Origami.ogg"

var song_list = [song_1, song_2, song_3, song_4, song_5, song_6, song_7, song_8, song_9, song_10, song_11]

func _return_to_menu():
	get_tree().change_scene_to_file("res://main_menu.tscn")

func hide_UI():
	$MenuButton.hide()
	$VegetableFactory/VegetableIndicatorA.hide()
	$VegetableFactory/VegetableIndicatorB.hide()
	$VegetableFactory/VegetableChart.hide()

func take_screenshot():
	hide_UI()
	get_tree().process_frame
	var img := get_viewport().get_texture().get_image()
	Screenshots.load_screenshot_texture(ImageTexture.create_from_image(img))

func game_over_screen():
	take_screenshot()
	await get_tree().create_timer(0.1).timeout #TODO make await work instead of this quantum grossness.
	get_parent().get_tree().paused = false
	get_tree().change_scene_to_file("res://game_over.tscn")

func _ready():
	play_song(song_list)

func _process(_delta):
	check_music()
	$Playfield/OutOfBounds/Area2D.get_overlapping_bodies().map(func(body):
		if(body.has_method("get_species") and not body.is_queued_for_deletion()):
			if(body.linear_velocity.snapped(Vector2(0.01, 0.01)) == Vector2.ZERO):
				game_over_screen()
		)

func check_music():
	if Settings.is_music_muted() == true:
		$MusicStreamPlayer.volume_db = -80
	else:
		$MusicStreamPlayer.volume_db = linear_to_db(Settings.get_music_volume())
	if Settings.is_muted() == true:
		$AudioStreamPlayer.volume_db = -80
	else:
		$AudioStreamPlayer.volume_db = linear_to_db(Settings.get_sfx_volume())
		$VegetableFactory/AudioStreamPlayer.volume_db = linear_to_db(Settings.get_sfx_volume())

func play_song(song_list):
	var the_song = load(song_list.pick_random())
	print("THE SONG")
	print(the_song)
	if the_song is AudioStream:
		print("play music")
		$MusicStreamPlayer.stream = the_song
		$MusicStreamPlayer.play()

func _on_vegetable_factory_spawned_vegetable():
	var the_sound = load(spawned_sound)
	if the_sound is AudioStream and Settings.is_muted() == false:
		$AudioStreamPlayer.stream = the_sound
		$AudioStreamPlayer.play()

func _on_menu_button_button_up():
	var settings_menu = load("res://settings_menu.tscn").instantiate()
	settings_menu.z_index = 10
	add_child(settings_menu)


func _on_music_stream_player_finished():
	play_song(song_list)
