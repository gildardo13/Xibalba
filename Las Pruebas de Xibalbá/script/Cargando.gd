extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Anim/CanvasLayer/ColorRect.modulate = Color("00ffffff")
	


func _on_Timer_timeout():
	$Anim/AnimationPlayer.play("fin")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://scenas/Mundo.tscn")

