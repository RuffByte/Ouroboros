extends Sprite2D

@export var room: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if room:
		print("need a room")
	pass
	
func get_closest_door_in_room() -> Node2D:
	var doors = room.get_node("doors").get_children()
	var shortest = INF
	var closest_door: Node2D
	#find closest door in the room
	for door in doors:
		var dist = ((door.global_position.x-self.global_position.x)**2 + (door.global_position.y-self.global_position.y)**2)**0.5
		if dist < shortest:
			shortest = dist
			closest_door = door
	return closest_door
	
func get_door_spawn_location(door) -> Vector2:
	return door.get_node("playerSpawnLocation").global_position
	
func _on_area_2d_body_entered(body):
	print("enter")
	if !room:
		return
	if body is Player:
		go_to_room(body)
		for enemy in owner.get_node("enemies").get_children():
			if enemy is Enemy and enemy.target is Player:
				var temp: Node2D = enemy.target
				enemy.set_target(self)
			else:
				push_warning("a non enemy is in a enemy only node")
				
	if body is Enemy and not body.target is Player:
		go_to_room(body)
		body.set_target(null)
		
func go_to_room(body: Node2D):
	var next_room: Node2D = get_closest_door_in_room()
	var location: Vector2 = get_door_spawn_location(next_room)
	body.position = location
