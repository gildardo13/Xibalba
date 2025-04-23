extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$CanvasLayer/AudioStreamPlayer.play()
	$CanvasLayer/TextureRect2.scale = Vector2.ZERO
	$AnimationPlayer.play("anim")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("salirJ"):
		get_tree().change_scene("res://scenas/Menu.tscn")


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenas/Menu.tscn")
