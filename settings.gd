extends Node2D

var muted = true
var music_muted = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func is_muted():
	return muted

func set_muted(truthy):
	muted = truthy

func is_music_muted():
	return music_muted

func set_music_muted(truthy):
	music_muted = truthy

