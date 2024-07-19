extends Node2D
func _process(delta: float) -> void:
	update_vision_cone()
@onready var player: Node2D = get_parent()  # Assuming the vision cone is a child of the player or a node under the player
func update_vision_cone() -> void:
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = mouse_position - player.global_position
	rotation = direction_to_mouse.angle()
