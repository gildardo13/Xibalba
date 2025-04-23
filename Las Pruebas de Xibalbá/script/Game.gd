extends Node
var profile = ["", "", "", "", ""]
var datos : Dictionary
var correos = ["gildardo@gmail.com", "Alan@gmail.com", "Carlos@gmail.com", "Lyon_Arthur@gmail.com", "Jesus@gmail.com" ]
var incre = 0
func _ready():
	get_parent().get_tree().paused = false
	$CanvasLayer/label/Label2.text = str(Global.puntos)
	
	for i in correos:
		Firebase.get_document2("users/%s" % i , $HTTPRequest, Global.leer())
		yield($HTTPRequest,"request_completed")
	guardar()
	$CanvasLayer/label.modulate = Color("#00ffffff")
	$AnimationPlayer.play("Nueva Animación")
	


func _process(delta):
	if Input.is_action_just_pressed("JostA"):
		get_parent().get_tree().change_scene("res://scenas/Menu.tscn")


func _on_TextureButton_pressed():
	get_parent().get_tree().change_scene("res://scenas/Menu.tscn")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	print(response_code)
	print(result_body)
	match response_code:
		404:
			
			return
		200:
			self.profile[incre] = result_body.fields
			incre += 1
			
			
func guardar():
	$CanvasLayer/puntos/Label.text = profile[0].nombre.stringValue
	$CanvasLayer/puntos/Label2.text = profile[1].nombre.stringValue
	$CanvasLayer/puntos/Label3.text = profile[2].nombre.stringValue
	$CanvasLayer/puntos/Label4.text = profile[3].nombre.stringValue
	$CanvasLayer/puntos/Label5.text = profile[4].nombre.stringValue
