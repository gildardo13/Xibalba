extends Node2D

var player_following = null
var text = "" setget text_set
var pos = Vector2.ZERO

onready var label = $Label

func _process(_delta: float) -> void:
	if player_following != null:
		pos = player_following.global_position
		pos.y = pos.y -80
		pos.x = pos.x -50
		global_position = pos
	
func text_set(new_text) -> void:
	text = new_text
	label.text = text
