extends Node2D

var nonce_count = 0

var index = 0

func get_nonce():
	nonce_count += 1
	return nonce_count

func set_scenes(vegetable_scenes):
	index = 0
	vegetable_scenes.map(func(scene):
		var indicator = Sprite2D.new()
		indicator.set_texture(scene.instantiate().get_texture())
		indicator.set_z_index(10)
		add_child(indicator)
		indicator.set_position(Vector2(position.x, position.y + (42 * index)))
		index += 1
		)
