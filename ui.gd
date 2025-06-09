extends Control

func _ready():
	pass

func _process(_delta):
	get_node("VBoxContainer/HBoxContainer/GarlicCounter").set_text(str(PlayerItems.get_garlic()))
	get_node("VBoxContainer/HBoxContainer2/PotatoCounter").set_text(str(PlayerItems.get_potato()))
	get_node("VBoxContainer/HBoxContainer3/TomatoCounter").set_text(str(PlayerItems.get_tomato()))
	get_node("VBoxContainer/HBoxContainer4/OnionCounter").set_text(str(PlayerItems.get_onion()))
	get_node("VBoxContainer/HBoxContainer5/PepperCounter").set_text(str(PlayerItems.get_pepper()))
	get_node("VBoxContainer/HBoxContainer6/CarrotCounter").set_text(str(PlayerItems.get_carrot()))
	get_node("VBoxContainer/HBoxContainer7/CucumberCounter").set_text(str(PlayerItems.get_cucumber()))
	get_node("VBoxContainer/HBoxContainer8/SquashCounter").set_text(str(PlayerItems.get_squash()))
	get_node("VBoxContainer/HBoxContainer9/BroccoliCounter").set_text(str(PlayerItems.get_broccoli()))
	get_node("VBoxContainer/HBoxContainer10/CabbageCounter").set_text(str(PlayerItems.get_cabbage()))
	get_node("VBoxContainer/HBoxContainer11/CauliflowerCounter").set_text(str(PlayerItems.get_cauliflower()))
	get_node("VBoxContainer/HBoxContainer12/PumpkinCounter").set_text(str(PlayerItems.get_pumpkin()))
