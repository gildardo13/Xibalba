extends Node
var player : KinematicBody2D
func _ready():

	player = get_parent().get_tree().get_nodes_in_group("player")[0]
	


func _process(delta):
	$ViewportContainer/Viewport/Mundo/Camera2D.global_position.x = player.global_position.x
	
	



	
