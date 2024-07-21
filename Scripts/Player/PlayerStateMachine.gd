extends StateMachine
@export var movement_component: MovementComponent
@export var gun : RayCast2D
var is_frozen = false
var can_hide : bool = false

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)
		child.animations = animation
		child.movement_component = movement_component
		child.raycast = gun
	if initial_state:
		initial_state.enter()
		current_state = initial_state
	animation.play("PlayerIdle")
		
func _process(delta):
	if can_hide and Input.is_action_just_pressed("interact"):
		if !is_frozen:
			on_child_transition(current_state, "playerfreeze")
			is_frozen = true
		else:
			on_child_transition(current_state, "playeridle")
			is_frozen = false

func _on_area_2d_area_entered(area):
	if area.get_parent() is Closet:
		can_hide = true
		
func _on_area_2d_area_exited(area):
	if area.get_parent() is Closet:
		can_hide = false

func _on_area_2d_body_entered(body):
	if body is Enemy:
		
		on_child_transition(current_state, "playerdeath")
