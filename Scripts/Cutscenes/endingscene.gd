extends Node2D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("ending_scene_1")
	SoundManager.play_sound("Horror")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_end() -> void:
	TransitionManager.flash_screen()
	SoundManager.play_sound("MagnumShot")
	await get_tree().create_timer(1).timeout
	TransitionManager.change_scene("res://Scenes/Cutscenes/endingtwo.tscn")
	
