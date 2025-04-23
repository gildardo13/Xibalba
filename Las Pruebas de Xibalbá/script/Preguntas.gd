extends Control

var valor = 1
var valor2 = 1
var valor3 = 1
var cadena = ""
var res1 = ["","", "",""]
var res = ""

func _ready():
	randomize()
	cargar()
	
	
	
func cargar():
	randomize()
	valor2 = int(rand_range(1,39))
	valor3 = int(rand_range(1,68))
	valor = int(rand_range(1,3))
	if(valor == 1):
		cadena += "res://img/Preguntas/ejercicios/Preguntas/"
		res += "res://img/Preguntas/ejercicios/Respuestas/"
		Global.tema =1
		Global.respuesta_correcta = Global.res_ejercicio[(valor3-1)]
	else:
		cadena += "res://img/Preguntas/teoria/Preguntas/"
		res += "res://img/Preguntas/teoria/Respuestas/"
		Global.tema =2
		Global.respuesta_correcta = Global.res_teoria[(valor2-1)]
	
	if Global.tema == 1:
		cadena += str(valor3) + ".PNG"
		res += str(valor3) + "/"
	else:
		cadena += str(valor2) + ".png"
		res += str(valor2) + "/"
		
	
	
	for i in range(4):
		var nuevo = res
		if Global.tema == 2:
			res1[i] = nuevo + str(i+1) + ".png";
		else:
			res1[i] = nuevo + str(i+1) + ".PNG";

	$CanvasLayer/Teoria/Pregunta.texture = load(cadena)
	$CanvasLayer/Teoria/A.texture = load((res1[0]))
	$CanvasLayer/Teoria/B.texture = load((res1[1]))
	$CanvasLayer/Teoria/C.texture = load((res1[2]))
	$CanvasLayer/Teoria/D.texture = load((res1[3]))
	cadena = ""
	res = ""
	res1 = ["","", "",""]


func _on_Menu_Pregunta_pre():
	cargar()
