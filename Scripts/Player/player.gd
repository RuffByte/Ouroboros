extends CharacterBody2D
class_name Player

@onready var facing: String = "Right"
@onready var InAction: bool = false

var is_hiding: bool = false
var is_dead: bool = false
