extends PointLight2D

@onready var player: Node2D = get_parent()

func _process(delta: float) -> void:
	update_vision_cone()

func update_vision_cone() -> void:
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = mouse_position - player.global_position
	rotation = direction_to_mouse.angle() + PI / 2
