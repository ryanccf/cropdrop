extends Node2D

var index = 0

func set_scenes(vegetable_scenes):
	index = 0
	vegetable_scenes.map(func(scene):
		var scene_instance = scene.instantiate()
		display_item(index, scene_instance.get_texture(), scene_instance._get_scale_modifier())
		index += 1
		)

func display_item(item_index, texture, scale_modifier):
		var indicator = Sprite2D.new()
		indicator.set_texture(texture)
		indicator.set_z_index(10)
		add_child(indicator)
		indicator.set_position(Vector2(position.x, position.y + (42 * item_index)))
		indicator.set_scale(indicator.scale * scale_modifier)
