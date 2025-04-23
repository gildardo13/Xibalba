extends Node2D

signal pregunta
signal terpre
signal pau_on
signal pau_of
signal pre 

signal android_of
signal andoird_on
func _ready():
	$CanvasLayer/Preguntas/CanvasLayer/Teoria.hide()
	$CanvasLayer/Control/ColorRect.hide()
	$CanvasLayer/Control/Panel.modulate = Color(1,1,1,0)
	$CanvasLayer/res.modulate = Color(1,1,1,0)
	$CanvasLayer/Control.hide()
	dis()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.responder:
		emit_signal("pau_on")
		$CanvasLayer/Control/ColorRect.show()
		$CanvasLayer/Control.show()
		emit_signal("pregunta")
		$AnimationPlayer.play("der")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "der":
		emit_signal("android_of")
		emit_signal("pre")
		enable()
		Global.responder = false
		efecto()
		$Tween.start()
	elif (anim_name == "iz"):
		dis()
		emit_signal("andoird_on")
		emit_signal("terpre")
		emit_signal("pau_of")
		efecto2()
		$Tween2.start()
		$CanvasLayer/Preguntas/CanvasLayer/Teoria.hide()
		$CanvasLayer/Control/ColorRect.hide()
	
	

func efecto():
	$Tween.interpolate_property(
		$CanvasLayer/Control/Panel,
		"modulate",
		Color(1,1,1,0),
		Color(1,1,1,1),
		0.5,Tween.TRANS_CIRC,Tween.EASE_IN_OUT
	)
	$Tween.interpolate_property(
		$CanvasLayer/res,
		"modulate",
		Color(1,1,1,0),
		Color(1,1,1,1),
		0.5,Tween.TRANS_CIRC,Tween.EASE_IN_OUT
	)
func efecto2():
	$Tween2.interpolate_property(
		$CanvasLayer/Control/Panel,
		"modulate",
		Color(1,1,1,1),
		Color(1,1,1,0),
		0.5,Tween.TRANS_CIRC,Tween.EASE_IN_OUT
	)
	$Tween2.interpolate_property(
		$CanvasLayer/res,
		"modulate",
		Color(1,1,1,1),
		Color(1,1,1,0),
		0.5,Tween.TRANS_CIRC,Tween.EASE_IN_OUT
	)



func _on_Tween_tween_completed(object, key):
	$CanvasLayer/Preguntas/CanvasLayer/Teoria.show()
	yield(get_tree().create_timer(12),"timeout")
	get_tree().paused = true
	
	
	


func _on_TextureButton_pressed():
	get_tree().paused = false
	if 1 == Global.respuesta_correcta:
		tem()
		$CanvasLayer/Label.text = "CORRECTA"
	else:
		tem2()
		$CanvasLayer/Label.text = "INCORRECTA"
	$AnimationPlayer.play("iz")
	Global.contador = 60
	


func _on_TextureButton2_pressed():
	get_tree().paused = false
	if 2 == Global.respuesta_correcta:
		tem()
		$CanvasLayer/Label.text = "CORRECTA"
	else:
		tem2()
		$CanvasLayer/Label.text = "INCORRECTA"
	$AnimationPlayer.play("iz")
	Global.contador = 60


func _on_TextureButton3_pressed():
	get_tree().paused = false
	if 3 == Global.respuesta_correcta:
		tem()
		$CanvasLayer/Label.text = "CORRECTA"
	else:
		tem2()
		$CanvasLayer/Label.text = "INCORRECTA"
	$AnimationPlayer.play("iz")
	Global.contador = 60


func _on_TextureButton4_pressed():
	get_tree().paused = false
	if 4 == Global.respuesta_correcta:
		tem()
		$CanvasLayer/Label.text = "CORRECTA"
	else:
		tem2()
		$CanvasLayer/Label.text = "INCORRECTA"
	$AnimationPlayer.play("iz")
	Global.contador = 60


func enable():
	$CanvasLayer/res/TextureButton.disabled = false
	$CanvasLayer/res/TextureButton2.disabled = false
	$CanvasLayer/res/TextureButton3.disabled = false
	$CanvasLayer/res/TextureButton4.disabled = false
func dis():
	$CanvasLayer/res/TextureButton.disabled = true
	$CanvasLayer/res/TextureButton2.disabled = true
	$CanvasLayer/res/TextureButton3.disabled = true
	$CanvasLayer/res/TextureButton4.disabled = true


func tem():
	if Global.tema == 1:
		Global.puntos += 200
	else:
		Global.puntos += 250
		
func tem2():
	if Global.tema == 1:
		Global.puntos -= 30
	else:
		Global.puntos -= 50


func _on_Tween2_tween_all_completed():
	get_parent().get_tree().paused = false
