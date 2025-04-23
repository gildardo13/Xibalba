extends Control
var profile = ""
var datos : Dictionary
func _ready():
	Firebase.get_document("users/%s" % Global.corre, $HTTPRequest)
	datos = Global.read()
	$CanvasLayer/ProgressBar.value = 0
	$Timer.start()
	
func _process(delta):
	if $CanvasLayer/ProgressBar.value >= 100:
		yield(get_tree().create_timer(0.5),"timeout")
		get_tree().change_scene("res://scenas/Menu.tscn")
		
func _on_Timer_timeout():
	$CanvasLayer/ProgressBar.value += 1


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	print(response_code)
	match response_code:
		404:
			return
		200:
			self.profile = result_body.fields
			guardar()
			$CanvasLayer/Label2.text = str(profile.correo.stringValue)
func guardar():
	datos["correo"] = profile.correo.stringValue
	datos["contra"] = profile.contra.stringValue
	datos["nombre"] = profile.nombre.stringValue
	datos["puntos"] = profile.puntos.stringValue
	datos["valid"] = true
	Global.save(Firebase.usuario)
	Global.save2(datos as Dictionary)
