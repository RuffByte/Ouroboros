extends Node

@onready var shooting: bool = false
@onready var player_ammo: int = 3
@onready var key_items : Array = ["test"]

func check_item(item: String):
	print(item, key_items)
	if item.to_lower() in key_items:
		return true
	return false

func add_item(item: String):
	key_items.append(item.to_lower())

func delete_item(item: String):
	key_items.erase(item)	
