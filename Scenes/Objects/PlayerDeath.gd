extends PlayerState

func enter() -> void:
	player.velocity.x = 0
	player.velocity.y = 0
	var collider = owner.get_node_or_null("CollisionShape2D")
	GameManager.key_items = []
	
	player.is_dead = true
	if collider:
		collider.queue_free()
	TransitionManager.change_scene("res://Scenes/Cutscenes/Jumpscare.tscn")
	

func exit() -> void:
	pass

func physics_update(delta: float) -> void:
	pass

