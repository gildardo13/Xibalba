extends Area2D

var p = position.y
var pl = p-20
var up = true
signal abrir
signal pregunta
func _ready():
	p = position.y
	pl = p-20
	
func _process(delta):
	if position.y == pl:
		up = false
	if position.y == p:
		up = true
	if up:
		position.y -= 1
	else:
		position.y += 1
func _on_Caja_body_entered(body):
	if body.name == "Admin":
		
		$CollisionShape2D.set_deferred("disabled", true)
		Global.contador = Global.cargatotal
		Global.opcPre = true
		$AudioStreamPlayer2D.play()
		


func _on_AudioStreamPlayer2D_finished():
	queue_free()
