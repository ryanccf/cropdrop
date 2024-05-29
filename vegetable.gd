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
	scale_nodes()

func scale_nodes():
	scale_node($Sprite2D)
	scale_node($CollisionShape2D)
	if (get_node_or_null("CollisionShape2D2")):
		scale_node($CollisionShape2D2)
	
func scale_node(node):
	var scale = Vector2(modify_scale(target_scale), modify_scale(target_scale))
	node.set_scale(scale)
	node.position *= scale

func modify_scale(multiplicand):
	return multiplicand * _get_scale_modifier()

func get_species():
	return species

func _get_scale_modifier():
	return 1

func get_texture():
	return $Sprite2D.texture

func _on_body_entered(body):
	if(not is_queued_for_deletion()):
		if(body.has_method("get_species") and not body.is_queued_for_deletion() and species == body.get_species()):
				body.queue_free()
				queue_free()
				merge_event.call((global_position+body.global_position)/2)
