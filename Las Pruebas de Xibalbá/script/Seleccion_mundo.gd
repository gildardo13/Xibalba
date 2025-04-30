extends Control
var num_mundo = 1
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$CanvasLayer/mundo.texture = load("res://img/NUEVO/mundo/selemundo" + str(num_mundo)  + ".png")
	if num_mundo == 1:
		num_mundo = 1
		Global.mundo = "oscuro"
		
	if num_mundo == 2:
		num_mundo = 2
		Global.mundo = "claro"
		

func _on_TextureButton2_pressed():
	num_mundo += 1
	if num_mundo >= 3:
		num_mundo = 1


func _on_TextureButton_pressed():
	num_mundo -= 1
	if num_mundo <= 0:
		num_mundo = 2


func _on_button_play_pressed():
	get_tree().change_scene("res://scenas/Cargando.tscn")
