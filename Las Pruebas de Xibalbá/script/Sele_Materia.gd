extends Control

var secu = [load("res://img/btn_fisica.png"),load("res://img/btn_quimica.png"), load("res://img/btn_geo.png")]
var primaria = [load("res://img/btn_espa.png"),load("res://img/btn_mate.png"), load("res://img/btn_ciencia.png")]
var prepa = [load("res://img/btn_lit.png"),load("res://img/btn_info.png"), load("res://img/btn_calculo.png")]


func _ready():
	if Global.estudio == 1:
		$CanvasLayer/TextureButton.texture_normal = primaria[0]
		$CanvasLayer/TextureButton2.texture_normal = primaria[1]
		$CanvasLayer/TextureButton3.texture_normal = primaria[2]
	elif Global.estudio == 2:
		$CanvasLayer/TextureButton.texture_normal = secu[0]
		$CanvasLayer/TextureButton2.texture_normal = secu[1]
		$CanvasLayer/TextureButton3.texture_normal = secu[2]
		
	elif Global.estudio == 3:
		$CanvasLayer/TextureButton.texture_normal = prepa[0]
		$CanvasLayer/TextureButton2.texture_normal = prepa[1]
		$CanvasLayer/TextureButton3.texture_normal = prepa[2]

func _process(delta):
	if Input.is_action_just_pressed("JostA"):
		Global.materia = 3
		get_tree().change_scene("res://scenas/Seleccion.tscn")
	elif Input.is_action_just_pressed("JosB"):
		Global.materia = 2
		get_tree().change_scene("res://scenas/Seleccion.tscn")
	elif Input.is_action_just_pressed("JosX"):
		Global.materia = 1
		get_tree().change_scene("res://scenas/Seleccion.tscn")


func _on_TextureButton_pressed():
	Global.materia = 1
	get_tree().change_scene("res://scenas/Seleccion.tscn")


func _on_TextureButton2_pressed():
	Global.materia = 2
	get_tree().change_scene("res://scenas/Seleccion.tscn")


func _on_TextureButton3_pressed():
	Global.materia = 3
	get_tree().change_scene("res://scenas/Seleccion.tscn")
