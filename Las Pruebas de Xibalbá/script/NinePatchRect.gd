extends NinePatchRect
var num_play = 1
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("izqJoss"):
		num_play -= 1
		if num_play <= 0:
			num_play = 6
	elif Input.is_action_just_pressed("derJos"):
		num_play -= 1
		if num_play <= 0:
			num_play = 6
	$image.texture = load("res://img/gatos/gato" + str(num_play) + ".png")
	if num_play == 1:
		num_play = 1
		Global.selector["player"] = "negro"
	if num_play == 2:
		num_play = 2
		Global.selector["player"] = "blanco"
	if num_play == 3:
		num_play = 3
		Global.selector["player"] = "amarillo"
	if num_play == 4:
		num_play = 4
		Global.selector["player"] = "cafe"
	if num_play == 5:
		num_play = 5
		Global.selector["player"] = "gris"
	if num_play == 6:
		num_play = 6
		Global.selector["player"] = "grisclaro"




func _on_TextureButton_pressed():
	num_play -= 1
	if num_play <= 0:
		num_play = 6


func _on_TextureButton2_pressed():
	num_play += 1
	if num_play >= 7:
		num_play = 1
