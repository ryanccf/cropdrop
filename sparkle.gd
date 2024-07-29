extends Node2D

func _ready():
	$AnimationPlayer.play("Die")

func self_delete():
	queue_free()
