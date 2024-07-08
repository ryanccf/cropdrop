extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Die")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func self_delete():
	queue_free()
