extends State
class_name PlayerState

@onready var player : Player = get_owner()
var movement_component : MovementComponent
var animations : AnimatedSprite2D
signal transitioned(state: PlayerState, new_state_name: String)
