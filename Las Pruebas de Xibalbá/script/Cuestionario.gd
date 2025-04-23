extends Node2D

var cadena = "res://img/Preguntas/"
var res1 = ["","", "",""]
var res = "res://img/Preguntas/"
var cade
var ress
var valor
func _ready():
	randomize()
	Global.colorOriginalRes[0] = $CanvasLayer/Interfaz/Inter/A.modulate
	Global.colorOriginalRes[1] = $CanvasLayer/Interfaz/Inter/B.modulate
	Global.colorOriginalRes[2] = $CanvasLayer/Interfaz/Inter/C.modulate
	Global.colorOriginalRes[3] = $CanvasLayer/Interfaz/Inter/D.modulate
	if Global.estudio == 2:
		cadena += "Secundaria/"
		res += "Secundaria/"
		if Global.materia == 1:
			cadena += "Fisica/Preguntas/"
			res += "Fisica/Respuestas/"
		elif Global.materia == 2:
			cadena += "Quimica/Preguntas/"
			res += "Quimica/Respuestas/"
		elif Global.materia == 3:
			cadena += "Geografia/Preguntas/"
			res += "Geografia/Respuestas/"
	elif Global.estudio == 1:
		cadena += "Primaria/"
		res += "Primaria/"
		if Global.materia == 1:
			cadena += "Español/Preguntas/"
			res += "Español/Respuestas/"
		elif Global.materia == 2:
			cadena += "Matematicas/Preguntas/"
			res += "Matematicas/Respuestas/"
		elif Global.materia == 3:
			cadena += "Ciencias/Preguntas/"
			res += "Ciencias/Respuestas/"
	elif Global.estudio == 3:
		cadena += "Prepa/"
		res += "Prepa/"
		if Global.materia == 1:
			cadena += "Literatura/Preguntas/"
			res += "Literatura/Respuestas/"
		elif Global.materia == 2:
			cadena += "Informatica/Preguntas/"
			res += "Informatica/Respuestas/"
		elif Global.materia == 3:
			cadena += "Calculo/Preguntas/"
			res += "Calculo/Respuestas/"
	cade = cadena
	ress = res
func cargar():
	valor = Global.preguntas[randi() % Global.preguntas.size()]
	if Global.estudio == 2:
		if Global.materia == 1:
			Global.respuesta = Global.res_fisica[valor - 1]
		elif Global.materia == 2:
			Global.respuesta = Global.res_quimi[valor - 1]
		elif Global.materia == 3:
			Global.respuesta = Global.res_geo[valor - 1]
	elif Global.estudio == 1:
		if Global.materia == 1:
			Global.respuesta = Global.res_espa[valor - 1]
		elif Global.materia == 2:
			Global.respuesta = Global.res_mate[valor - 1]
		elif Global.materia == 3:
			Global.respuesta = Global.res_ciencia[valor - 1]
	elif Global.estudio == 3:
		if Global.materia == 1:
			Global.respuesta = Global.res_lite[valor - 1]
		elif Global.materia == 2:
			Global.respuesta = Global.res_info[valor - 1]
		elif Global.materia == 3:
			Global.respuesta = Global.res_calculo[valor - 1]
	#valor = Globals.preTeo[randi() % Globals.preTeo.size()]
	#Globals.respuesta = Globals.resTeo[valor - 1]
	cadena = cadena  + "p" + str(valor) + ".png"
	res = res + "p" + str(valor) + "/"
	$CanvasLayer/Interfaz/Inter/Pregunta.texture = load(cadena)
	for i in 4:
		res1[i] = "r" + str(i+1) + ".png"
	
	$CanvasLayer/Interfaz/Inter/A.texture_normal = load(res + res1[0])
	$CanvasLayer/Interfaz/Inter/B.texture_normal = load(res + res1[1])
	$CanvasLayer/Interfaz/Inter/C.texture_normal = load(res + res1[2])
	$CanvasLayer/Interfaz/Inter/D.texture_normal = load(res + res1[3])
	
	
	cadena = cade
	res1 = ["","", "",""]
	res = ress
	Global.erasse = int( valor)





func _on_Interfaz_cargar():
	cargar()
