extends Node

export (PackedScene) var Mob
func _ready():
	$TileMap.queue_free()
	$Interfaz/Timer.start()
	Global.OriPer = $Admin.modulate
	iniciar()
	$Inicio/Anim/AnimationPlayer.play("inicio")
	if OS.get_name() == "Windows":
		Global.android = false
	elif OS.get_name() == "Android":
		Global.android = true
	
	#$Interfaz/CanvasLayer/Jos/Control/CanvasLayer/joystick.show() if Global.android else $Interfaz/CanvasLayer/Jos/Control/CanvasLayer/joystick.hide()
func _process(delta):
	
	if Global.puntos >= 2600 or Global.vida <= 20:
		get_tree().change_scene("res://scenas/Game.tscn")
	
		
func iniciar():
	Global.contador = Global.cargatotal
	Global.puntos = 0
	Global.vida =100
	



func _on_Timer_timeout():
	$CanvasLayer2/Path2D/PathFollow2D.offset = randi()
	var mob = Mob.instance()
	
	var direction = $CanvasLayer2/Path2D/PathFollow2D.rotation + PI / 2
	mob.position = $CanvasLayer2/Path2D/PathFollow2D.position
	direction += rand_range(-PI / 4, PI / 4)
	#mob.rotation = direction
	add_child(mob)
	
