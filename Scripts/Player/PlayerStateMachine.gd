extends StateMachine
@export var movement_component: MovementComponent

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)
		child.animations = animation
		child.movement_component = movement_component
	if initial_state:
		initial_state.enter()
		current_state = initial_state
	animation.play("PlayerIdleRight")
		
