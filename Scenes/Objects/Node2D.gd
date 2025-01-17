extends Node2D
func _process(delta: float) -> void:
	update_vision_cone()
	
@onready var player: Node2D = get_parent() 

func update_vision_cone() -> void:
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = mouse_position - player.global_position
	# Set the rotation of the vision cone to the angle towards the mouse position
	rotation = direction_to_mouse.angle()
