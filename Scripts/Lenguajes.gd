extends MarginContainer

var language_file = "res://Resources/language.csv"
var current_language = "es"

func _ready():
	load_language()

func load_language():
	var file = File.new()
	if file.file_exists(language_file):
		file.open(language_file, File.READ)
		while !file.eof_reached():
			var line = file.get_line().strip_edges()
			if line.empty() or line.begins_with("#"):
				continue
			var parts = line.split(",")
			if parts.size() < 2:
				continue
			var key = parts[0].strip_edges()
			var value = parts[1].strip_edges()
			if key.empty() or value.empty():
				continue
			translation[key] = value
		file.close()

func save_language():
	var file = File.new()
	file.open(language_file, File.WRITE)
	for key in translation.keys():
		var value = translation[key]
		file.put_line(key + "," + value)
	file.close()

func set_language(lang):
	current_language = lang
	load_language()
	save_language()

func _on_Espanol_pressed():
	set_language("es")
	translate_scene()

func _on_Ingles_pressed():
	set_language("en")
	translate_scene()

func _on_Atras_pressed():
	get_tree().change_scene("res://Scenes/Configuracion.tscn")

func translate_scene():
	var nodes = get_tree().get_nodes_in_group("Translatable")
	for node in nodes:
		translate_node(node)

func translate_node(node):
	if node.has_method("set_text"):
		var key = node.get_name()
		if translation.has(key):
			node.set_text(translation[key])










