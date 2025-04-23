extends Node2D

func _ready():
	if Global.puntos >= 2500:
		$CanvasLayer/Label.text = "Ganaste"
		$CanvasLayer/Label2.text = str(2600)
	else:
		$CanvasLayer/Label2.text = ":("
		$CanvasLayer/Label.text = "Perdiste"
func _process(delta):
	pass
func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenas/Menu.tscn")
