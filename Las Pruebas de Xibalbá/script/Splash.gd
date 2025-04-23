extends Node

var num = 1
var datos : Dictionary
func _ready():
	
	datos = Global.read() 
	
	if datos["valid"]:
		num = 2
	else:
		num = 1
	$AnimationPlayer.play("splash")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if num == 2:
		get_tree().change_scene("res://scenas/Menu.tscn")
	else:
		get_tree().change_scene("res://scenas/Login.tscn")
