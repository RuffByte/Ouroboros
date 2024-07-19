extends Node2D

@onready var player: Player = get_parent()
@export var animations: AnimatedSprite2D
@export var movement_component: MovementComponent
var facing_vector: Vector2

func _physics_process(delta: float) -> void:
	if player.InAction:
		return
	update_facing_direction()
		
	if player.velocity.y == 0 && player.velocity.x == 0:
		animations.play("PlayerIdle" + player.facing)
		return
	else:
		animations.play("PlayerWalk" + player.facing)
		return

func update_facing_direction():
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = (mouse_position - player.global_position).normalized()
	print(direction_to_mouse)
	if abs(direction_to_mouse.x) > abs(direction_to_mouse.y):
		if direction_to_mouse.x > 0:
			player.facing = "Right"
		else:
			player.facing = "Left"
	else:
		if direction_to_mouse.y > 0:
			player.facing = "Down"
		else:
			player.facing = "Up"


			
