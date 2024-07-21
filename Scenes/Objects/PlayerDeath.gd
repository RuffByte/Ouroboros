extends PlayerState

func enter() -> void:
	player.velocity.x = 0
	player.velocity.y = 0
	$"../../CollisionShape2D".queue_free()

func exit() -> void:
	pass

func physics_update(delta: float) -> void:
	pass

