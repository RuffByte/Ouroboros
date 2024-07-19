extends Sprite2D

@export var room: Node2D
@export var index: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if room:
		if !index:
			print("Need an index")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_new_player_location() -> Vector2:
	var door = room.get_node("doors").get_child(index).get_node("playerSpawnLocation") as Node2D
	return door.global_position
	
func _on_area_2d_body_entered(body):
	if !room:
		return
	if body is Playerrr:
		var new_pos = get_new_player_location()
		body.position = new_pos
