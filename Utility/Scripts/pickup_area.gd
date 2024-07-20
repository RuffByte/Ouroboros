extends Area2D
class_name PickupArea

@export var sprite : Sprite2D
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
var in_area : bool = false
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass	
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var tween = create_tween()
		tween.tween_property(sprite, "modulate", Color(1,1,0), 0.1)
		in_area = true
		
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		var tween = create_tween()
		tween.tween_property(sprite, "modulate", Color(1,1,1), 0.1)
		in_area = false

func _process(delta: float) -> void:
	if !in_area:
		return
	if Input.is_action_pressed("interact"):
		dialogue()
		
func dialogue() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	
