extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var camera_2d: Camera2D = $Camera2D

func _ready() -> void:
	animation_player.play("introduction")
	
func _process(delta: float) -> void:
	pass
