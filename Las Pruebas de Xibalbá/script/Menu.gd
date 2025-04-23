extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var datos: Dictionary
func _ready():
	datos = Global.read() 
	Global.corre = datos["correo"]
	$AnimationPlayer.play("anim")
	Global.contador = 60
	Global.puntos = 100
	Global.respuesta_correcta = 0
	$CanvasLayer/AudioStreamPlayer.play()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("JostA"):
		get_tree().change_scene("res://scenas/Seleccion_nivel.tscn")
	elif Input.is_action_just_pressed("JosB"):
		get_tree().change_scene("res://scenas/Seleccion.tscn")
	elif Input.is_action_just_pressed("JosX"):
		get_tree().change_scene("res://scenas/Credito.tscn")
	elif Input.is_action_just_pressed("JosY"):
		get_tree().quit()

func _on_credi_pressed():
	get_tree().change_scene("res://scenas/Credito.tscn")





func _on_star_pressed():
	get_tree().change_scene("res://scenas/Seleccion_nivel.tscn")


func _on_perfil_pressed():
	get_tree().change_scene("res://scenas/Seleccion.tscn")


func _on_quit_pressed():
	get_tree().quit()
