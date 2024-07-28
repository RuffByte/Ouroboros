extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.stop_sound("TimeWhistle")
	SoundManager.stop_sound("Horror")
	SoundManager.play_sound("SubwaySurfers")
	SoundManager.play_sound("VineBoom")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
