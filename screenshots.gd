extends Node2D

var last_texture

func load_screenshot_texture(tex):
	last_texture = tex

func get_screenshot_texture():
	return last_texture
