extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var pao = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("JosStart") :
		self.play("ini")
		pao = true
		get_parent().get_node("CanvasLayer/Barra").visible = false
		get_tree().paused = true
		
		
	if get_tree().paused and pao:
		if Input.is_action_just_pressed("JostA"):
			get_tree().paused = false
			pao = false
			get_parent().get_node("CanvasLayer/Barra").visible = true
			get_parent().get_tree().reload_current_scene()
		elif Input.is_action_just_pressed("JosX"):
			self.play("fin")
			get_parent().get_node("CanvasLayer/Barra").visible = true
			pao = false
			get_tree().paused = false
		elif Input.is_action_just_pressed("JosB"):
			get_tree().paused = false
			pao = false
			get_parent().get_node("CanvasLayer/Barra").visible = true
			get_parent().get_tree().change_scene("res://scenas/Menu.tscn")
