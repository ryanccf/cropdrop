extends Node2D

var garlic = 0
var potato = 0
var tomato = 0
var onion = 0
var pepper = 0
var carrot = 0
var cucumber = 0
var squash = 0
var broccoli = 0
var cabbage = 0
var cauliflower = 0
var pumpkin = 0

var save_path = "user://cropdrop_user_data.save"

func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(garlic)
	file.store_var(potato)
	file.store_var(tomato)
	file.store_var(onion)
	file.store_var(pepper)
	file.store_var(carrot)
	file.store_var(cucumber)
	file.store_var(squash)
	file.store_var(broccoli)
	file.store_var(cabbage)
	file.store_var(cauliflower)
	file.store_var(pumpkin)

func load_data():
	if FileAccess.file_exists(save_path):
		print("file found")
		var file = FileAccess.open(save_path, FileAccess.READ)
		garlic = file.get_var(garlic)
		potato = file.get_var(potato)
	else:
		print("no Player Items save file was loaded...")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_garlic(garlic)
	set_potato(potato)
	print(get_garlic())
	print(get_potato())
	load_data()

func get_garlic():
	return garlic

func set_garlic(newVal):
	garlic = newVal
	save_data()

func add_garlic(additional):
	garlic += additional
	save_data()

func get_potato():
	return potato

func set_potato(newVal):
	potato = newVal
	save_data()

func add_potato(additional):
	potato += additional
	save_data()

func get_tomato():
	return tomato

func set_tomato(newVal):
	tomato = newVal
	save_data()

func add_tomato(additional):
	tomato += additional
	save_data()

func get_onion():
	return onion

func set_onion(newVal):
	onion = newVal
	save_data()

func add_onion(additional):
	onion += additional
	save_data()

func get_pepper():
	return pepper

func set_pepper(newVal):
	pepper = newVal
	save_data()

func add_pepper(additional):
	pepper += additional
	save_data()

func get_carrot():
	return carrot

func set_carrot(newVal):
	carrot = newVal
	save_data()

func add_carrot(additional):
	carrot += additional
	save_data()

func get_cucumber():
	return cucumber

func set_cucumber(newVal):
	cucumber = newVal
	save_data()

func add_cucumber(additional):
	cucumber += additional
	save_data()

func get_squash():
	return squash

func set_squash(newVal):
	squash = newVal
	save_data()

func add_squash(additional):
	squash += additional
	save_data()

func get_broccoli():
	return broccoli

func set_broccoli(newVal):
	broccoli = newVal
	save_data()

func add_broccoli(additional):
	broccoli += additional
	save_data()

func get_cabbage():
	return cabbage

func set_cabbage(newVal):
	cabbage = newVal
	save_data()

func add_cabbage(additional):
	cabbage += additional
	save_data()

func get_cauliflower():
	return cauliflower

func set_cauliflower(newVal):
	cauliflower = newVal
	save_data()

func add_cauliflower(additional):
	cauliflower += additional
	save_data()

func get_pumpkin():
	return pumpkin

func set_pumpkin(newVal):
	pumpkin = newVal
	save_data()

func add_pumpkin(additional):
	pumpkin += additional
	save_data()
