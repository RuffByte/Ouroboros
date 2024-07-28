extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.stop_sound("TimeWhistle")
	Ui.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_video_stream_player_finished():
	TransitionManager.change_scene("res://Scenes/UI/main_menu.tscn")
	GameManager.player_ammo = 3
