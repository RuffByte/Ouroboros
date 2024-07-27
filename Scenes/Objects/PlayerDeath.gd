extends PlayerState

func enter() -> void:
	player.velocity.x = 0
	player.velocity.y = 0
	var collider = owner.get_node_or_null("CollisionShape2D")
	player.is_dead = true
	if collider:
		collider.queue_free()
	
	await get_tree().create_timer(4).timeout
	TransitionManager.change_scene("res://Scenes/UI/main_menu.tscn")
	

func exit() -> void:
	pass

func physics_update(delta: float) -> void:
	pass

