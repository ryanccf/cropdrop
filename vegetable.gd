extends RigidBody2D

var species = "vegetable"
var species_index = 0
var target_scale = 5
var merge_event = func(global_position):pass

func on_merge(event):
	merge_event = event

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	size_self()
	#$CollisionShape2D.scale=Vector2(target_scale, target_scale)

func size_self():
	$CollisionShape2D.set_scale(Vector2(target_scale, target_scale))
	set_scale(Vector2(target_scale,target_scale))

func get_species():
	return species

func get_texture():
	return $Sprite2D.texture


func _on_body_entered(body):
	if(not is_queued_for_deletion()):
		if(body.has_method("get_species") and not body.is_queued_for_deletion() and species == body.get_species()):
				body.queue_free()
				queue_free()
				merge_event.call((global_position+body.global_position)/2)
