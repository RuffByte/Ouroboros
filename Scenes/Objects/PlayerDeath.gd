extends PlayerState

func enter() -> void:
	player.velocity.x = 0
	player.velocity.y = 0
	var collider = get_parent().get_parent().get_node_or_null("CollisionShape2D")
	print(collider)
	if collider:
		collider.queue_free()

func exit() -> void:
	pass

func physics_update(delta: float) -> void:
	pass

