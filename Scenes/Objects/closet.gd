extends StaticBody2D
class_name Closet

var player: Player
var is_player_hiding:bool = false
var player_can_hide: bool = false

func _ready():
	pass 
	
func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		if player_can_hide:
			if !is_player_hiding:
				hide_player()
			else:
				show_player()
	pass
			
func hide_player():
	player.global_position = global_position
	player.is_hiding = true
	is_player_hiding = true
	player.visible = false
	does_ghost_see_player()
			
	
func show_player():
	player.global_position = get_node("popout").global_position
	player.is_hiding = false
	is_player_hiding = false
	player.visible = true	
	does_ghost_see_player()

func does_ghost_see_player():
	for enemy in owner.get_node("enemies").get_children():
		if enemy is Ghost:
			var dist = enemy.global_position.distance_to(get_node("popout").global_position)
			if dist < 80.0:
				enemy.set_target(player)
				enemy.reset_aggro()
				enemy.reset_idle()
			print(dist)


func _on_area_2d_area_entered(area: Area2D) -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(0.7,0.7,1), 0.1)
	if area.owner is Player:
		player = area.owner
		player_can_hide = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(1,1,1), 0.1)
	if area.owner is Player:
		player = null
		player_can_hide = false
