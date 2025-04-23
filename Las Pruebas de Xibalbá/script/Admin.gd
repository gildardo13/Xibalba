extends KinematicBody2D
var player = Vector2(0,0)
var velocidad = 400
var velocity = Vector2.ZERO
var FOOR = Vector2(0, -1)
var gravedad = 60
onready var gato = $AnimatedSprite
onready var jostk = get_tree().get_nodes_in_group("controlPa")[0].get_parent().get_node("joystick/boton")
func _ready():
	$Name.text = Global.selector["datos"]
	$AnimatedSprite.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite3.hide()
	$AnimatedSprite4.hide()
	$AnimatedSprite5.hide()
	$AnimatedSprite6.hide()
	$AudioStreamPlayer.play()
	
	if Global.selector["player"] == "negro":
		gato = $AnimatedSprite
	elif Global.selector["player"] == "blanco":
		gato = $AnimatedSprite2
	elif Global.selector["player"]== "amarillo":
		gato = $AnimatedSprite3
	elif Global.selector["player"]== "cafe":
		gato = $AnimatedSprite4
	elif Global.selector["player"] == "gris":
		gato = $AnimatedSprite5
	elif Global.selector["player"] == "grisclaro":
		gato = $AnimatedSprite6
	gato.show()

func _process(delta):
	control(delta)
	extra()
	
func _axc(): #Mando del Jugador
	var nuevo = Vector2.ZERO
	if Input.is_action_pressed("JostA"):
		print("PRESS A")
	if  not OS.get_name() == "Android":
		nuevo.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		nuevo.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		#nuevo.x = int(Input.is_action_pressed("derJos")) - int(Input.is_action_pressed("izqJoss"))
		#nuevo.y = int(Input.is_action_pressed("abaJos")) - int(Input.is_action_pressed("arrJos"))
	else:
		if jostk.get_value().x > 0:
			nuevo.x  = 1
		elif jostk.get_value().x < 0:
			nuevo.x  = -1
		else:
			nuevo.x  = 0
		if jostk.get_value().y > 0.3:
			if jostk.get_value().y  > 0.95:
				nuevo.x = 0
			nuevo.y = 1
		elif jostk.get_value().y < -0.3:
			if jostk.get_value().y  < -0.95:
				nuevo.x = 0
			nuevo.y = -1
		
		else:
			nuevo.y  = 0
	return nuevo
func control(delta):
	#player.y += gravedad
	if _axc().x == 1:
		gato.play("caminar")
		gato.flip_h = false
	elif _axc().x == -1:
		gato.play("caminar")
		gato.flip_h = true
	elif _axc().y == 1:
		gato.play("abajo")
	elif _axc().y == -1:
		gato.play("arriba")
	else:
		gato.playing = false
	
		
	if _axc().length() > 0:
		player = _axc().normalized() * velocidad
	else:
		player = Vector2.ZERO
	player += player * delta
	player = move_and_slide(player, FOOR)
func extra():
	if Input.is_action_just_pressed("maullar") or Input.is_action_just_pressed("JosB") :
		$AudioStreamPlayer2D.play()
	if Input.is_action_pressed("correr") or Input.is_action_pressed("JostA") :
		gato.speed_scale = 6
		velocidad = 800
	else:
		gato.speed_scale = 1
		velocidad = 400



