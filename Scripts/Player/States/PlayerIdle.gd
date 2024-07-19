extends PlayerState

func enter() -> void:
	player.velocity.x = 0
	player.velocity.y = 0

func physics_update(delta: float) -> void:
	if !movement_component.get_movement_direction().is_zero_approx():
		transitioned.emit(self, "PlayerMove")
