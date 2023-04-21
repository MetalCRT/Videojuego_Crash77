extends Button


# Creamos la variable que almacenará el idioma seleccionado
var idioma_actual = ""

# Conectamos la señal "pressed" al script
func _on_Boton_Ingles_pressed():
	# Guardamos el idioma seleccionado en la variable "idioma_actual"
	idioma_actual = "en"
	# Llamamos a la función para cambiar el idioma del juego
	cambiar_idioma()

# Función para cambiar el idioma del juego
func cambiar_idioma():
	# Cargamos el archivo con las traducciones correspondientes al idioma seleccionado
	var traducciones = load("res://traducciones/" + idioma_actual + ".csv")
	# Recorremos todos los nodos del juego
	for nodo in get_tree().get_nodes_in_group("localizable"):
		# Si el nodo tiene un atributo "texto" lo traducimos
		if nodo.has_attribute("texto"):
			nodo.set("texto", traducciones[nodo.get("texto")])

	# Guardamos el idioma seleccionado en las variables de configuración
	var configuracion = get_node("/root/Configuracion")
	configuracion.set("idioma_actual", idioma_actual)
	configuracion.save()

	# Mostramos un mensaje de confirmación
	var mensaje = get_node("/root/Mensaje")
	mensaje.set("texto", "Idioma cambiado a " + idioma_actual)
	mensaje.show()

