extends Node
signal cargar

func _ready():
	$Cuestionario/CanvasLayer/Interfaz/Inter.rect_global_position.y = 1000
	$CanvasLayer/Pausa.rect_global_position = Vector2(0,1000)
	
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Barra/TextureProgress/Label2.text = "Puntos: " + str(Global.puntos)
	$CanvasLayer/Barra/TextureProgress.value = Global.vida

	
	if Global.contador <= 0:
		Global.contador = Global.cargatotal
		Global.vida -= 5
	if  not OS.get_name() == "Android":
		$CanvasLayer/Jos/Control/CanvasLayer/joystick.hide()
	else:
		$CanvasLayer/Jos/Control/CanvasLayer/joystick.show()
	
	if Global.opcPre:
		if OS.get_name() == "Android":
			hideAndroid()
		emit_signal("cargar")
		$Cuestionario/AnimationPlayer.play("ini")
		yield($Cuestionario/AnimationPlayer,"animation_finished")
		Global.opcPre = false
	$CanvasLayer/Barra/Sprite2/Label.text = str(Global.contador)



		
		
func _on_Timer_timeout():
	Global.contador -= 1




func _on_TextureButton_pressed():
	$AnimationPlayer.play("ini")
	if OS.get_name() == "Android":
		$CanvasLayer/Jos/Control/CanvasLayer/joystick.hide()
	$CanvasLayer/Barra.visible = false
	get_tree().paused = true


func _on_exit_pressed():
	$AnimationPlayer.play("fin")
	if OS.get_name() == "Android":
		$CanvasLayer/Jos/Control/CanvasLayer/joystick.show()
	$CanvasLayer/Barra.visible = true
	get_tree().paused = false


func _on_reini_pressed():
	get_tree().paused = false
	if OS.get_name() == "Android":
		$CanvasLayer/Jos/Control/CanvasLayer/joystick.show()
	$CanvasLayer/Barra.visible = true
	get_parent().get_tree().reload_current_scene()


func _on_menu_pressed():
	get_tree().paused = false
	if OS.get_name() == "Android":
		$CanvasLayer/Jos/Control/CanvasLayer/joystick.show()
	$CanvasLayer/Barra.visible = true
	get_parent().get_tree().change_scene("res://scenas/Menu.tscn")


func _on_A_pressed():
	disBt()
	if(Global.respuesta == 1):
		$Cuestionario/CanvasLayer/Interfaz/Inter/A.modulate = Color("#2cc90c")
		Global.puntos += 250
	else:
		$Cuestionario/CanvasLayer/Interfaz/Inter/A.modulate = Color("#cd1e1e")
		Global.puntos -= 60
		Global.vida -= 10
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")


func _on_B_pressed():
	disBt()
	if(Global.respuesta == 2):
		Global.puntos += 250
		$Cuestionario/CanvasLayer/Interfaz/Inter/B.modulate = Color("#2cc90c")
	else:
		Global.puntos -= 60
		Global.vida -= 10
		$Cuestionario/CanvasLayer/Interfaz/Inter/B.modulate = Color("#cd1e1e")
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")


func _on_C_pressed():
	disBt()
	if(Global.respuesta == 3):
		$Cuestionario/CanvasLayer/Interfaz/Inter/C.modulate = Color("#2cc90c")
		Global.puntos += 250
	else:
		$Cuestionario/CanvasLayer/Interfaz/Inter/C.modulate = Color("#cd1e1e")
		Global.puntos -= 60
		Global.vida -= 10
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")

func _on_D_pressed():
	disBt()
	if(Global.respuesta == 4):
		$Cuestionario/CanvasLayer/Interfaz/Inter/D.modulate = Color("#2cc90c")
		Global.puntos += 250
	else:
		$Cuestionario/CanvasLayer/Interfaz/Inter/D.modulate = Color("#cd1e1e")
		Global.puntos -= 60
		Global.vida -= 10
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")
	

func modul():
	$Cuestionario/CanvasLayer/Interfaz/Inter/A.modulate = Global.colorOriginalRes[0]
	$Cuestionario/CanvasLayer/Interfaz/Inter/B.modulate = Global.colorOriginalRes[1]
	$Cuestionario/CanvasLayer/Interfaz/Inter/C.modulate = Global.colorOriginalRes[2]
	$Cuestionario/CanvasLayer/Interfaz/Inter/D.modulate = Global.colorOriginalRes[3]
func disBt():
	$Cuestionario/CanvasLayer/Interfaz/Inter/A.set_deferred("disabled", true)
	$Cuestionario/CanvasLayer/Interfaz/Inter/B.set_deferred("disabled", true)
	$Cuestionario/CanvasLayer/Interfaz/Inter/C.set_deferred("disabled", true)
	$Cuestionario/CanvasLayer/Interfaz/Inter/D.set_deferred("disabled", true)
	
func enaBt():
	$Cuestionario/CanvasLayer/Interfaz/Inter/A.set_deferred("disabled", false)
	$Cuestionario/CanvasLayer/Interfaz/Inter/B.set_deferred("disabled", false)
	$Cuestionario/CanvasLayer/Interfaz/Inter/C.set_deferred("disabled", false)
	$Cuestionario/CanvasLayer/Interfaz/Inter/D.set_deferred("disabled", false)

func hideAndroid():
	$CanvasLayer/Jos/Control/CanvasLayer/joystick.hide()
	$CanvasLayer/Jos/Control/CanvasLayer/joystick/boton.hide()
func showAndroid():
	$CanvasLayer/Jos/Control/CanvasLayer/joystick.show()
	$CanvasLayer/Jos/Control/CanvasLayer/joystick/boton.show()


func _on_AnimationPlayer_animation_finished(anim_name):
	modul()
	if anim_name == "ini":
		Global.aplica = true
		get_parent().get_tree().paused = true
	elif anim_name == "fin":
		enaBt()
		get_parent().get_tree().paused = false
		if OS.get_name() == "Android":
			showAndroid()


func _on_AnimationPlayer_actA():
	disBt()
	if(Global.respuesta == 1):
		$Cuestionario/CanvasLayer/Interfaz/Inter/A.modulate = Color("#2cc90c")
		Global.puntos += 250
	else:
		$Cuestionario/CanvasLayer/Interfaz/Inter/A.modulate = Color("#cd1e1e")
		Global.puntos -= 60
		Global.vida -= 10
	Global.aplica = false
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")


func _on_AnimationPlayer_actB():
	disBt()
	if(Global.respuesta == 2):
		Global.puntos += 250
		$Cuestionario/CanvasLayer/Interfaz/Inter/B.modulate = Color("#2cc90c")
	else:
		Global.puntos -= 60
		Global.vida -= 10
		$Cuestionario/CanvasLayer/Interfaz/Inter/B.modulate = Color("#cd1e1e")
	Global.aplica = false
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")



func _on_AnimationPlayer_actX():
	disBt()
	if(Global.respuesta == 3):
		$Cuestionario/CanvasLayer/Interfaz/Inter/C.modulate = Color("#2cc90c")
		Global.puntos += 250
	else:
		$Cuestionario/CanvasLayer/Interfaz/Inter/C.modulate = Color("#cd1e1e")
		Global.puntos -= 60
		Global.vida -= 10
	Global.aplica = false
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")


func _on_AnimationPlayer_actY():
	disBt()
	if(Global.respuesta == 4):
		$Cuestionario/CanvasLayer/Interfaz/Inter/D.modulate = Color("#2cc90c")
		Global.puntos += 250
	else:
		$Cuestionario/CanvasLayer/Interfaz/Inter/D.modulate = Color("#cd1e1e")
		Global.puntos -= 60
		Global.vida -= 10
	Global.aplica = false
	yield(get_tree().create_timer(0.7),"timeout")
	$Cuestionario/AnimationPlayer.play("fin")
