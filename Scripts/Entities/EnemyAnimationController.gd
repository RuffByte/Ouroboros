extends Node2D


@export var animations: AnimatedSprite2D

@onready var monster = get_parent()  # Reference to the monster node

var facing_vector: Vector2

func _physics_process(delta: float) -> void:
	facing_vector = monster.velocity.normalized()  # Update facing_vector based on monster's velocity
	
	
	if monster.velocity.length() == 0:
		animations.play("MonsterIdle")
		return
	else:
		animations.play("MonsterWalk" + get_facing_direction())
		return

func get_facing_direction() -> String:
	if facing_vector.y < 0:
		return "Up"
	elif facing_vector.y > 0:
		return "Down"
	elif facing_vector.x > 0:
		return "Right"
	elif facing_vector.x < 0:
		return "Left"
	return "Down"  # Default direction if no movement
