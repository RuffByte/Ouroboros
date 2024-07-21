extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var flash: ColorRect = $FLASH

func _ready() -> void:
	flash.visible = false
	color_rect.visible = false
	
func change_scene(scene: String) -> void:
	color_rect.visible = true
	$AnimationPlayer.play("transition")
	get_tree().change_scene_to_file(scene)	
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards("transition")
	color_rect.visible = false

func flash_screen() -> void:
	flash.visible = true
	$AnimationPlayer.play("FLASH")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards("transition")
	flash.visible = false

func end_game() -> void:
	flash.visible = true
	$AnimationPlayer.play("END-GAME")
	get_tree().quit()
