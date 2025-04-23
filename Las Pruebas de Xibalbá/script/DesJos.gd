extends AnimationPlayer

signal actA
signal actB
signal actX
signal actY
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("JostA") and Global.aplica:
		Global.aplica = false
		emit_signal("actA")
	elif Input.is_action_just_pressed("JosB") and Global.aplica:
		Global.aplica = false
		emit_signal("actB")
	elif Input.is_action_just_pressed("JosX") and Global.aplica:
		Global.aplica = false
		emit_signal("actX")
	elif Input.is_action_just_pressed("JosY") and Global.aplica:
		Global.aplica = false
		emit_signal("actY")
		
	
