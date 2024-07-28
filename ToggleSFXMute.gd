extends CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	button_pressed = Settings.is_muted()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_toggled(toggled_on):
	Settings.set_muted(toggled_on)
