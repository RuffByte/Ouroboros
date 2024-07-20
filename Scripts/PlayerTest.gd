extends CharacterBody2D
class_name Playerrr

const SPEED = 200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
	move_player(direction, delta)
	move_and_slide()
	
func move_player(direction: Vector2, delta:float):
	if direction.length() > 0:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, 1000 * delta)
	move_and_slide()	
	
