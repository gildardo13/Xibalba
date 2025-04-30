extends Control
var profile = "d"
var datos : Dictionary
func _ready():
	datos = Global.read() 

	Firebase.get_document2("users/%s" % datos["correo"], $HTTPRequest, Global.leer())
	
	$CanvasLayer/menu/restric.hide()
	$CanvasLayer/menu/LineEdit.text = datos["nombre"]
	$AudioStreamPlayer.play()


func _process(delta):
	if Input.is_action_just_pressed("salirJ"):
		get_tree().change_scene("res://scenas/Menu.tscn")
	elif Input.is_action_just_pressed("RB"):
		datos["valid"] = false
		Global.save2(datos as Dictionary)
		get_tree().change_scene("res://scenas/Login.tscn")
		
	elif Input.is_action_just_pressed("JostA"):
		if not ($CanvasLayer/menu/LineEdit.text.empty()):
			Global.selector["datos"] = $CanvasLayer/menu/LineEdit.text
			get_tree().change_scene("res://scenas/Menu.tscn")
		
		else:
			$CanvasLayer/menu/restric.show()
		
	
		
		
func _on_bplayer_pressed():
	get_tree().change_scene("res://scenas/Seleccion_mundo.tscn")

func _on_text_timeout():
	$CanvasLayer/Juega.visible =  !$CanvasLayer/Juega.visible




func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	print(response_code)
	match response_code:
		404:
		
			return
		200:

			self.profile = result_body.fields
			$CanvasLayer/Label.text = "PUNTOS: " + str(profile.puntos.stringValue)


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenas/Menu.tscn")


func _on_TextureButton2_pressed():
	datos["valid"] = false
	Global.save2(datos as Dictionary)
	get_tree().change_scene("res://scenas/Login.tscn")
	
