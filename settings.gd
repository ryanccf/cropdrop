extends Node2D

var muted = true
var music_muted = true

var save_path = "user://cropdrop_settings.save"

func save_settings():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(muted)
	file.store_var(music_muted)

func load_settings():
	if FileAccess.file_exists(save_path):
		print("file found")
		var file = FileAccess.open(save_path, FileAccess.READ)
		muted = file.get_var()
		music_muted = file.get_var()
	else:
		print("no save file was loaded...")

# Called when the node enters the scene tree for the first time.
func _ready():
	load_settings()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func is_muted():
	return muted

func set_muted(truthy):
	muted = truthy
	save_settings()

func is_music_muted():
	return music_muted

func set_music_muted(truthy):
	music_muted = truthy
	save_settings()

