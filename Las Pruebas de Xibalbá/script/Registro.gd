extends Control

var profile := {
	"correo": {},
	"contra": {},
	"nombre": {},
	"puntos": {}
} setget set_profile
func _ready():
	$Label.hide()


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://scenas/Login.tscn")


func _on_TextureButton_pressed():
	if restricciones():
		profile.correo = { "stringValue": $correo.text }
		profile.nombre = { "stringValue": $name.text}
		profile.contra= { "stringValue": $contra.text}
		profile.puntos = { "stringValue": "0"}
		Global.corre =$correo.text
		Firebase.registro($correo.text, $contra.text, $HTTPRequest, $correo.text)
		
func restricciones():
	var valid = true
	if ($correo.text.empty() or $contra.text.empty() or $name.text.empty() or  $contra2.text.empty()) and valid != false:
		valid = false
		$Label.text = "Uno de los campos esta vacio"
	if ($correo.text.length() < 12 or  $contra.text.length() < 8  or $name.text.length() < 8) and valid != false:
		valid = false
		$Label.text = "Deben contener al menos 12 y 8 caracter"
	if (not($contra.text == $contra2.text)) and valid != false :
		valid = false
		$Label.text = "No coiciden las contraseñas"
	if valid == false:
		$Label.show()
	return valid


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var resul_body = JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		$Label.text =  resul_body.result.error.message.capitalize()
		$Label.show()
	else:
		$Label.text = "Datos guardados"
		Global.registro = true
		Global.nombre = profile
		print(Global.nombre)
		yield(get_tree().create_timer(2),"timeout")
		get_tree().change_scene("res://scenas/Login.tscn")
		
		



func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	var resul_body2 = JSON.parse(body.get_string_from_ascii())
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	match response_code:
		404:
			$Label.text =  resul_body2.result.error.message.capitalize()
			$Label.show()
		200:
			$Label.text = "Datos guardados"
			yield(get_tree().create_timer(2),"timeout")
			get_tree().change_scene("res://scenas/Login.tscn")


func set_profile(value: Dictionary) -> void:
	profile = value
	$name.text = profile.nombre.stringValue
	$correo.text = profile.correo.stringValue
	$contra.text = profile.contra.stringValue
