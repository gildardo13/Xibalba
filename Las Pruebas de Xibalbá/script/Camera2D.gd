extends Camera2D

onready var player




func _process(delta):
	if Global.camera:
		player = get_tree().get_nodes_in_group("player")[0]
		global_position.x = player.global_position.x
		global_position.y = player.global_position.y
