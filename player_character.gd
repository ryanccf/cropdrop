# Player.gd (attached to your CharacterBody2D node)
extends CharacterBody2D

@export var speed: float = 120.0 # Adjust this for the desired movement speed
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $Sprite2D.get_node("AnimationPlayer")

func handle_animation(direction):
	if (direction[0] > 0.5):
		animation_player.play("Right")
	elif (direction[0] < -0.5):
		animation_player.play("Left")
	elif (direction[1] < 0.5 or direction[1] > 0.5):
		animation_player.play("Shimmy")

func _physics_process(delta: float) -> void:
	# Handle regular overhead movement
	var input_direction = Vector2.ZERO
	var direction = Input.get_vector("Player_Left", "Player_Right", "Player_Up", "Player_Down", 0)
	input_direction.x = direction.x
	input_direction.y = direction.y 

	# Normalize the input_direction to prevent faster diagonal movement
	if input_direction.length() > 0:
		input_direction = input_direction.normalized()
		handle_animation(input_direction)

	velocity = input_direction * speed

	# Move the CharacterBody2D using the calculated velocity
	move_and_slide()
