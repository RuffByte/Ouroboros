extends Node2D
class_name MovementComponent

func get_movement_direction() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	

func wants_interact() -> bool:
	return Input.is_action_just_pressed("interact")
