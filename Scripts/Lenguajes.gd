extends MarginContainer
var selected_language = "en"

@onready var espanol = %Espanol
@onready var ingles = %Ingles
@onready var volver = %Volver
@onready var seleccionar = %Seleccionar

func _ready():
	var config = ConfigFile.new()
	if config.load("user://config.cfg") == OK:
		selected_language = config.get_value("settings", "selected_language", selected_language)
	TranslationServer.set_locale(selected_language)

	espanol.pressed.connect(_on_espanol_pressed)
	ingles.pressed.connect(_on_ingles_pressed)
	volver.pressed.connect(_on_volver_pressed)

	seleccionar.text = tr("SEL")
	espanol.text = tr("ES")
	ingles.text = tr("EN")
	volver.text = tr("VOL")

	# Set the language buttons text based on the selected language
	if selected_language == "es":
		espanol.text = tr("ES") + " ✓"
		ingles.text = tr("EN")
	else:
		espanol.text = tr("ES")
		ingles.text = tr("EN") + " ✓"

	
func _on_espanol_pressed():
	TranslationServer.set_locale("es")
	selected_language = "es"
	save_config()
	espanol.text = tr("ES")
	ingles.text = tr("EN")
	volver.text = tr("VOL")
	seleccionar.text = tr("SEL")
	
	
func _on_ingles_pressed():
	TranslationServer.set_locale("en")
	selected_language = "en"
	save_config()
	espanol.text = tr("ES")
	ingles.text = tr("EN")
	volver.text = tr("VOL")
	seleccionar.text = tr("SEL")
	
func _on_volver_pressed():
	get_tree().change_scene_to_file("res://Scenes/configuracion.tscn")
	
# Función para guardar la configuración del idioma seleccionado
func save_config():
	var config = ConfigFile.new()
	config.set_value("settings", "selected_language", selected_language)
	var error = config.save("user://config.cfg")
	if error != OK:
		print("Failed to save config file: " + str(error))
		
func load_config():
	var config = ConfigFile.new()
	if config.load("user://config.cfg") == OK:
		selected_language = config.get_value("settings", "selected_language", selected_language)
	TranslationServer.set_locale(selected_language)
