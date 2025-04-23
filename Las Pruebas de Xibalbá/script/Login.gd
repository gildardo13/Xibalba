extends Control
func _ready():
	$Label.hide()
	if Global.registro:
		Firebase.save_document("users?documentId=%s" % Global.corre, Global.nombre, $HTTPRequest2)
func _process(delta):
	pass
	
	

func restricciones():
	var valid = true
	if ($correo.text.empty() or $contra.text.empty()) and valid != false:
		valid = false
		$Label.text = "Uno de los campos esta vacio"
	if ($correo.text.length() < 12 or $contra.text.length() < 8) and valid != false:
		valid = false
		$Label.text = "Deben contener al menos 12 y 8 caracter"
	if valid == false:
		$Label.show()
	return valid


func _on_TextureButton_pressed():
	if restricciones():
		Firebase.login($correo.text, $contra.text, $HTTPRequest, $correo.text)


func _on_Button_pressed():
	get_tree().change_scene("res://scenas/Registro.tscn")



func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var resul_body = JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		$Label.text = resul_body.result.error.message.capitalize()
		$Label.show()
	else:
		$Label.text = "exitoso"
		$Label.show()
		Global.corre = $correo.text
		yield(get_tree().create_timer(2),"timeout")
		get_tree().change_scene("res://scenas/Cargar.tscn")





func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	var resul_body2 = JSON.parse(body.get_string_from_ascii())
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	match response_code:
		404:
			$Label.text =  resul_body2.result.error.message.capitalize()
			$Label.show()
		200:
			$Label.text = "Datos guardados"
			
