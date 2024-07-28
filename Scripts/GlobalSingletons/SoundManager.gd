extends Node

func play_sound(sound: String) -> void:
	get_node(sound).play() 

func stop_sound(sound: String) -> void:
	get_node(sound).stop()
