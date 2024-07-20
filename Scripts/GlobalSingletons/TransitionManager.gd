extends CanvasLayer

func _ready() -> void:
	self.visible = false
	
func change_scene(scene: String) -> void:
	self.visible = true
	$AnimationPlayer.play("transition")
	get_tree().change_scene_to_file(scene)	
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards("transition")
	self.visible = false
