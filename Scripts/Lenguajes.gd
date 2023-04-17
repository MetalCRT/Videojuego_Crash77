extends MarginContainer


const LANGUAGE_FILE_PATH = "res://Resources/Lenguajes.csv"
const DEFAULT_LANGUAGE = "es"
var currentLanguage = DEFAULT_LANGUAGE

func _ready():
	# Configura los textos iniciales del juego
	set_language(currentLanguage)
	
	# Conecta la señal de pulsación de los botones a los métodos correspondientes
	$Lenguajes/Espanol.connect("pressed", self, "set_language", [ "es" ])
	$Lenguajes/Ingles.connect("pressed", self, "set_language", [ "en" ])
	$Lenguajes/Volver.connect("pressed", self, "go_to_configuracion")

func set_language(language: String) -> void:
	# Carga el archivo CSV y obtiene las traducciones correspondientes al idioma elegido
	var translations = {}
	var file = File.new()
	if file.open(LANGUAGE_FILE_PATH, File.READ) == OK:
		var line = file.get_line()
		while line != "":
			var keys = line.split(",")
			var values = file.get_line().split(",")
			translations[keys[0]] = values
			line = file.get_line()
		file.close()
	else:
		print_error("Error al cargar el archivo de idiomas")
		return
	
	# Actualiza los textos del juego con las traducciones correspondientes
	var nodes = get_tree().get_nodes_in_group("localized")
	for node in nodes:
		if node.has_method("set_translation"):
			node.set_translation(translations[node.get_name()][language])
	
	# Guarda el idioma actual en el archivo de configuración
	currentLanguage = language
	var config = ConfigFile.new()
	config.load("user://config.cfg")
	config.set_value("language", currentLanguage)
	config.save("user://config.cfg")
	
func go_to_configuracion() -> void:
	# Carga la escena de configuración y cambia a ella
	var configuracion = load("res://Scenes/configuracion.tscn")
	get_tree().change_scene_to(configuracion)




