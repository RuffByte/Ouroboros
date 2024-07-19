extends PlayerState
const SPEED: float = 100.0
const FRICTION : float = 250.0
var direction : Vector2 

func physics_update(delta: float) -> void:
	if player.InAction:
		return
	
	direction = movement_component.get_movement_direction()
	if direction.y * SPEED == 0 &&  direction.x * SPEED == 0:
		transitioned.emit(self, "PlayerIdle")
		
	if direction.length() > 0:
		player.velocity = direction * SPEED
	else:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	player.move_and_slide()	
	
	
