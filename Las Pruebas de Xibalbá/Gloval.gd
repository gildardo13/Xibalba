extends Node
var selector = {"player": "negro", "datos": "Alan"}
var mundo = "claro"
var opc = 0
var android = false
var player_master = null
var ui = null
var descision = false

var alive_players = []
var  camera = true
var save_file="user://savedata.bin"
var path = "res://data.save"
var responder = false


var contador = 60
var puntos = 0
var vida = 100

var estudio =0
var materia = 0

var registro = false
var nombre =  {}
var corre = ""
var aplica = false
var OriPer = ""
var res_fisica = [3,1,2,1,1]
var res_geo = [2,3,3,1,1]
var res_quimi = [3,3,4,1,4]

var res_espa= [3,3,2,1,1]
var res_mate = [3,2,3,3,2]
var res_ciencia = [3,3,1,2,2]

var res_lite= [1,3,1,1,1]
var res_info = [1,4,1,2,1]
var res_calculo = [2,2,3,1,3]

var opcPre = false
var preguntas = [1,2,3,4,5]
var respuesta = 0 
var colorOriginalRes = [0,0,0,0]
var colorOriginalRes2 = [0,0,0,0]
var erasse =0


var cargatotal = 50

var respuesta_correcta = 0
var tema = 1

func instance_node_at_location(node, parent: Object, location: Vector2):
	var node_instance = instance_node(node,parent)
	return node_instance

func instance_node(node, parent: Object) -> Vector2:
	var node_instance = node.instance()
	parent.add_child(node_instance)
	return node_instance


#Guardado incriptado
func save2(data : Dictionary):
	var f = File.new()
	var err = f.open_encrypted_with_pass(save_file,File.WRITE,"godot")
	f.store_var(data)
	f.close()
	
func read():
	var v : Dictionary
	var f = File.new()
	if f.file_exists(save_file):
		var err = f.open_encrypted_with_pass(save_file,File.READ,"godot")
		v=f.get_var()
		f.close()
	else:
		save2(
			{
				"correo" : "",
				"contra" : "",
				"nombre" : "",
				"puntos" : "",
				"valid": false
			}
		)
		v = {
				"correo" : "",
				"contra" : "",
				"nombre" : "",
				"puntos" : "",
				"valid": false
			}
	return v



#Otra manera
func save(dato):
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_var(dato)
	file.close()

func leer():
	var v = 0
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		v = file.get_var()
		file.close()
		return v
	
	return v
