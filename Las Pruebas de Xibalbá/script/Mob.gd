extends Area2D

#warning-ignore-all:unused_class_variable
export var min_speed = 150
export var max_speed = 250
var mob_types = ["walk", "swim", "fly"]
var gravedad = 5
var quitar = false
func _ready():
	
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.play()



func _process(delta):
	global_position.y += gravedad
	if quitar:
		Global.vida -= 0.4
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Mob_body_entered(body):
	quitar = true
	$AudioStreamPlayer2D.play()
	body.modulate = Color("#c31b1b")


func _on_Mob_body_exited(body):
	quitar = false
	body.modulate = Global.OriPer
