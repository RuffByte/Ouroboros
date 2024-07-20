extends Enemy
class_name Ghost

const AGGROTIME: float = 5.0
var SPEED : float = 45.0
var TP_TIMER: float = 10

var target: Node2D
var aggroTimer: float

var idleTimer: float = 0
var hasFinishFollowIntoRoom: bool = false
var isInView : bool = false

var unlockedRoam: bool = false

func _ready():
	pass

func _physics_process(delta) -> void:
			
	if unlockedRoam:
		idleTimer += delta
		if idleTimer / 10.0 > 1.0:
			reset_idle()
			teleport_to_random_room()
			return		
	time_aggro(delta)
	if !target:
		return
		
	var target_position = (target.global_position - global_position).normalized()
	velocity.x = target_position.x * SPEED
	velocity.y = target_position.y * SPEED
	move_and_slide()

func _on_detect_area_body_entered(body) -> void:
	if body is Player:
		isInView = true
		await get_tree().create_timer(0.5).timeout
		reset_aggro()
		reset_idle()
		target = body

func teleport_to_random_room():
	var rooms:Array = owner.get_node("rooms").get_children()
	var selected_room_index = (randf() * len(rooms))/1
	print(selected_room_index, rooms[selected_room_index])
	global_position = rooms[selected_room_index].global_position

func _on_detect_area_body_exited(body):
	if body is Player:
		isInView = false
		await get_tree().create_timer(0.5).timeout
		isInView = false
	
func time_aggro(delta) -> void:
	if !isInView:
		if aggroTimer > 0.0:
			aggroTimer -= delta
		else:
			target = null
		
func set_target(body):
	target = body
	
func reset_aggro() -> void:
	aggroTimer = AGGROTIME
	
func reset_idle() -> void:
	idleTimer = 0.0

func get_hit_LOL_REKT_360():
	SPEED -= 30
	await get_tree().create_timer(6).timeout
	SPEED += 30

