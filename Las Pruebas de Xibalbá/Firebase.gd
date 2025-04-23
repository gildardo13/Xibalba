extends Node

const API_KEY = "AIzaSyABBwdSyOnhBiUvPn2WVE7FDA3g2YE-HvU"
const PROJECT_ID := "godot2-cf4a5"

const REGISTER_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=%s" % API_KEY
const LOGIN_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=%s" % API_KEY
const FIRESTORE_URL := "https://firestore.googleapis.com/v1/projects/%s/databases/(default)/documents/" % PROJECT_ID
var usuario :PoolStringArray
var user_info := {}





func _get_request_headers() -> PoolStringArray:
	return PoolStringArray([
		"Content-Type: application/json",
		"Authorization: Bearer %s" % user_info.token
	])

#Obtener token
func _get_user_info(result: Array) -> Dictionary:
	var result_body := JSON.parse(result[3].get_string_from_ascii()).result as Dictionary
	return {
		"token": result_body.idToken,
		"id": "namee2"
	}
	
func registro(email: String, password: String, http: HTTPRequest, name:String) -> void:
	var body := {
		"email": email,
		"password": password,
	}
	http.request(REGISTER_URL, [], false, HTTPClient.METHOD_POST, to_json(body))
	var result := yield(http, "request_completed") as Array
	print(result[1])
	if result[1] == 200:
		user_info = _get_user_info(result) as Dictionary
		
		


func login(email: String, password: String, http: HTTPRequest, name:String) -> void:
	var body := {
		"email": email,
		"password": password,
		"returnSecureToken": true
	}
	http.request(LOGIN_URL, [], false, HTTPClient.METHOD_POST, to_json(body))
	var result := yield(http, "request_completed") as Array
	if result[1] == 200:
		user_info = _get_user_info(result)
		
		
		
func save_document(path: String, fields: Dictionary, http: HTTPRequest) -> void:
	var document := { "fields": fields }
	var body := to_json(document)
	var url := FIRESTORE_URL + path
	usuario =_get_request_headers()
	http.request(url, usuario, false, HTTPClient.METHOD_POST, body)


func get_document(path: String, http: HTTPRequest) -> void:
	var url := FIRESTORE_URL + path
	usuario =_get_request_headers()
	http.request(url, usuario, false, HTTPClient.METHOD_GET)
	
	
func get_document2(path: String, http: HTTPRequest, body:PoolStringArray) -> void:
	var url := FIRESTORE_URL + path
	http.request(url,body, false, HTTPClient.METHOD_GET)

func update_document(path: String, fields: Dictionary, http: HTTPRequest) -> void:
	var document := { "fields": fields }
	var body := to_json(document)
	var url := FIRESTORE_URL + path
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_PATCH, body)


func delete_document(path: String, http: HTTPRequest) -> void:
	var url := FIRESTORE_URL + path
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_DELETE)
