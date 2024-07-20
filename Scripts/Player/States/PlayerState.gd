extends State
class_name PlayerState

@onready var player : Player = get_owner()

var movement_component : MovementComponent
var animations : AnimatedSprite2D
var raycast : RayCast2D
signal transitioned(state: PlayerState, new_state_name: String)


func _input(event: InputEvent) -> void:
	var mouse_position = get_global_mouse_position()
	var actual_direction = mouse_position - global_position
	raycast.target_position = actual_direction * 10000

	if GameManager.player_ammo > 0 and event.is_action_pressed("shoot") and !GameManager.shooting:
		GameManager.player_ammo -= 1
		GameManager.shooting = true
	
		if raycast.is_colliding():
			if raycast.get_collider() is Ghost:
				raycast.get_collider().get_hit_LOL_REKT_360()
				print("hello")
		await get_tree().create_timer(1).timeout
		GameManager.shooting = false

	
