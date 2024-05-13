extends RigidBody2D

var species = "vegetable"
var species_index = 0

var duplication_event = func(global_position):pass

func set_duplication_event(event):
	duplication_event = event


# Called when the node enters the scene tree for the first time.
func _ready():
	var vegetables = ["Tomato", "Garlic"]
	contact_monitor = true
	max_contacts_reported = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(not is_queued_for_deletion()):
		get_colliding_bodies().map(func(body):
			if(body.has_method("get_species") and not body.is_queued_for_deletion() and species == body.get_species()):
				body.queue_free()
				queue_free()
				duplication_event.call((global_position+body.global_position)/2)
		)
		#if(body.has_method("get_species")):
		#	print(body.get_species()))
			

func get_species():
	return species

#func spawn_next_fruit():
#	duplication_event.call(global_position)
#	print("spawn next fruit")
