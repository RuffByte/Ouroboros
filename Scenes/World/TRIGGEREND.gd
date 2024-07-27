extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionManager.change_scene("res://Scenes/Cutscenes/endingscene.tscn")
