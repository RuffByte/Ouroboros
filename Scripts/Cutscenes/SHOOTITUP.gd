extends Node2D
class_name SHOOTITUP

@onready var animation_player: AnimationPlayer = $AnimationPlayer
const GAME_END = preload ("res://dialogue/gameEnd.dialogue")
const DONTSHOOT = preload ("res://dialogue/DONTSHOOT.dialogue")
var playing: bool = false
var end: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
	
func anim_start() -> void:
	animation_player.play("introduction")
	SoundManager.play_sound("Horror")

func game_end() -> void:
	DialogueManager.show_example_dialogue_balloon(GAME_END, "start")

func dont_shoot() -> void:
	DialogueManager.show_example_dialogue_balloon(DONTSHOOT, "start")

func shoot_sound() -> void:
	SoundManager.play_sound("MagnumShot")
	TransitionManager.flash_screen()
	if end:
		$"../AnimatedSprite2D".play("PlayerDeath")
	

func on_finish() -> void:
	if !end:
		Ui.visible = true
		TransitionManager.change_scene("res://Scenes/World/main_world_2.tscn")
	else:
		TransitionManager.change_scene("res://Scenes/Cutscenes/kys.tscn")
