extends Control

@onready var panel_animation_player: AnimationPlayer = get_node("Panel/PanelAnimationPlayer")

func _ready():
	get_node("Panel").position = Vector2(-300 ,0)

func _process(_delta):
	get_node("Panel/VBoxContainer/HBoxContainer/GarlicCounter").set_text(str(PlayerItems.get_garlic()))
	get_node("Panel/VBoxContainer/HBoxContainer2/PotatoCounter").set_text(str(PlayerItems.get_potato()))
	get_node("Panel/VBoxContainer/HBoxContainer3/TomatoCounter").set_text(str(PlayerItems.get_tomato()))
	get_node("Panel/VBoxContainer/HBoxContainer4/OnionCounter").set_text(str(PlayerItems.get_onion()))
	get_node("Panel/VBoxContainer/HBoxContainer5/PepperCounter").set_text(str(PlayerItems.get_pepper()))
	get_node("Panel/VBoxContainer/HBoxContainer6/CarrotCounter").set_text(str(PlayerItems.get_carrot()))
	get_node("Panel/VBoxContainer/HBoxContainer7/CucumberCounter").set_text(str(PlayerItems.get_cucumber()))
	get_node("Panel/VBoxContainer/HBoxContainer8/SquashCounter").set_text(str(PlayerItems.get_squash()))
	get_node("Panel/VBoxContainer/HBoxContainer9/BroccoliCounter").set_text(str(PlayerItems.get_broccoli()))
	get_node("Panel/VBoxContainer/HBoxContainer10/CabbageCounter").set_text(str(PlayerItems.get_cabbage()))
	get_node("Panel/VBoxContainer/HBoxContainer11/CauliflowerCounter").set_text(str(PlayerItems.get_cauliflower()))
	get_node("Panel/VBoxContainer/HBoxContainer12/PumpkinCounter").set_text(str(PlayerItems.get_pumpkin()))

func _on_texture_button_toggled(toggled_on: bool) -> void:
	panel_animation_player.play("Appear") if toggled_on else panel_animation_player.play("Disappear")
