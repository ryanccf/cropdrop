extends RigidBody2D

var species = "vegetable"
var species_index = 0
var target_scale = 5
var merge_event = func(global_position):pass

func on_merge(event):
	merge_event = event

func _ready():
	continuous_cd = 2
	contact_monitor = true
	max_contacts_reported = 1
#	scale_nodes()

func scale_nodes():
	scale_node($Sprite2D)
	scale_node($CollisionShape2D)
	if (get_node_or_null("CollisionShape2D2")):
		scale_node($CollisionShape2D2)

func get_ratio():
	return Vector2(modify_scale(target_scale), modify_scale(target_scale))

func scale_node(node):
	node.position *= get_ratio()
#	if "shape" in node:
#		scale_shape(node.shape) 
#	else:
	if not "shape" in node:
		node.set_scale(get_ratio())

func scale_shape(shape):
	if "extents" in shape:
		shape.extents = get_ratio()
	if "radius" in shape:
		shape.radius = get_ratio().x
	if "height" in shape:
		shape.height *= get_ratio().x
	if "length" in shape:
		shape.length *= get_ratio().x
	print(shape)

func modify_scale(multiplicand):
	return multiplicand * _get_scale_modifier()

func get_species():
	return species

func _get_scale_modifier():
	return 1

func get_texture():
	return $Sprite2D.texture

# attempt #1 to merge
func _physics_process(_delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		merge_bodies(body)

# attempt #2 to merge
func _on_body_entered(body):
	merge_bodies(body)

func merge_bodies(body):
	if(not is_queued_for_deletion()):
		if(body.has_method("get_species") and not body.is_queued_for_deletion() and species == body.get_species()):
			var middle_position = (global_position + body.global_position)/2
			body.queue_free()
			queue_free()
			merge_event.call(middle_position)
