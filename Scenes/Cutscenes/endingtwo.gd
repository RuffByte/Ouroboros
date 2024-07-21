extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).get_node("Camera2D").enabled = false
	get_child(0).get_node("PURPLEGUYFROMFNAF").visible = false
	get_child(0).end = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
