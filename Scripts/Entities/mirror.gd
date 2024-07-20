extends Node2D

@export var character : Node

func _process(_delta) -> void:
	_update_reflection_position()
	#_update_reflection_frame()

func _update_reflection_position():
	var distance_y = character.global_position.y - global_position.y
	$Reflection.global_position = Vector2(character.global_position.x, global_position.y - distance_y)
	
#func get_mirrored_frame():
	#var animations : AnimatedSprite2D = character.get_node("AnimatedSprite2D")
	#var frame = animations.get_frame()
	#print(frame)
	#if frame < 8 or frame > 14 and frame < 24:
		#return frame + 8
	#return frame - 8
#
#func _update_reflection_frame():
	#$Reflection.frame = get_mirrored_frame()
	#
	#pass
