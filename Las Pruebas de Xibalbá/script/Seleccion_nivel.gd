extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/AudioStreamPlayer.play()
	$CanvasLayer/prepa.scale = Vector2.ZERO
	$CanvasLayer/primaria.scale = Vector2.ZERO
	$CanvasLayer/secun2.scale = Vector2.ZERO
	
	$AnimationPlayer.play("anim")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("JostA"):
		Global.estudio = 1
		get_tree().change_scene("res://scenas/Sele_Materia.tscn")
	elif Input.is_action_just_pressed("JosB"):
		Global.estudio = 2
		get_tree().change_scene("res://scenas/Sele_Materia.tscn")
		
	elif Input.is_action_just_pressed("JosX"):
		Global.estudio = 3 
		get_tree().change_scene("res://scenas/Sele_Materia.tscn")
	elif Input.is_action_just_pressed("salirJ"):
		get_tree().change_scene("res://scenas/Menu.tscn")


func _on_quit_pressed():
	get_tree().change_scene("res://scenas/Menu.tscn")


func _on_prepa_pressed():
	Global.estudio = 3 
	get_tree().change_scene("res://scenas/Sele_Materia.tscn")


func _on_primaria2_pressed():
	Global.estudio = 1
	get_tree().change_scene("res://scenas/Sele_Materia.tscn")


func _on_secun_pressed():
	Global.estudio = 2
	get_tree().change_scene("res://scenas/Sele_Materia.tscn")
