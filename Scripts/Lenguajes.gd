extends MarginContainer

var translation = {}
var current_language = ""

@onready var espanol = $Espanol
@onready var ingles = $Ingles
@onready var volver = $Volver

func _ready():
	# Cargamos la traducción por defecto, que es en inglés
	load_translation("en")

	# Conectamos las señales de los botones
	espanol.pressed.connect(_on_espanol_pressed)
	ingles.pressed.connect(_on_ingles_pressed)
	volver.pressed.connect(_on_volver_pressed)

func _on_espanol_pressed():
	# Cargamos la traducción en español
	load_translation("es")

func _on_ingles_pressed():
	# Cargamos la traducción en inglés
	load_translation("en")

func _on_volver_pressed():
	# Vamos a la escena de configuración
	get_tree().change_scene("res://Scenes/configuracion.tscn")

func load_translation(lang_code):
	# Comprobamos si ya se ha cargado la traducción para el idioma seleccionado
	if lang_code == current_language:
		return

	# Cargamos el archivo .json correspondiente
	var translation_file = "res://Resources/" + lang_code + ".json"
	var file = File.new()
	if file.file_exists(translation_file):
		file.open(translation_file, File.READ)
		translation = JSON.parse(file.get_as_text())
		file.close()

		# Aplicamos la traducción a todos los nodos de la escena
		apply_translation(translation)

		# Guardamos el idioma actual
		current_language = lang_code

func apply_translation(translation_dict):
	# Recorremos todos los nodos de la escena
	for node in get_tree().get_nodes_in_group("Translation"):
		# Obtenemos el nombre del texto a traducir
		var text_name = node.get_name().split("_")[1]
		if text_name in translation_dict:
			# Si existe una traducción para ese texto, la aplicamos
			node.set_text(translation_dict[text_name])

