extends Node2D

const AL = preload("res://Scenes/m_arrow_left.tscn")
const AD = preload("res://Scenes/m_arrow_down.tscn")
const AU = preload("res://Scenes/m_arrow_up.tscn")
const AR = preload("res://Scenes/m_arrow_right.tscn")

var random = 0
var RNG = RandomNumberGenerator.new()

func _process(delta):
	pass


func _on_timer_timeout():
	$Timer.start()
	RNG.randomize()
	var random_int = RNG.randi_range(0,4)
	random = random_int
	
	match random :
		1:
			var al = AL.instantiate()
			get_parent().add_child(al)
			al.position = $Creator/Marker2D_AL.global_position
		2:
			var ad = AD.instantiate()
			get_parent().add_child(ad)
			ad.position = $Creator/Marker2D_AD.global_position
		3:
			var au = AU.instantiate()
			get_parent().add_child(au)
			au.position = $Creator/Marker2D_AU.global_position
		4:
			var ar = AR.instantiate()
			get_parent().add_child(ar)
			ar.position = $Creator/Marker2D_AR.global_position
			

#chequea si vector está dentro del area
func is_inside_area(p: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2) -> bool:
	var t1 = (p.x - p1.x) * (p2.y - p1.y) - (p.y - p1.y) * (p2.x - p1.x)
	var t2 = (p.x - p2.x) * (p3.y - p2.y) - (p.y - p2.y) * (p3.x - p2.x)
	var t3 = (p.x - p3.x) * (p4.y - p3.y) - (p.y - p3.y) * (p4.x - p3.x)
	var t4 = (p.x - p4.x) * (p1.y - p4.y) - (p.y - p4.y) * (p1.x - p4.x)
	return (t1 > 0 and t2 > 0 and t3 > 0 and t4 > 0) or (t1 < 0 and t2 < 0 and t3 < 0 and t4 < 0)



# Obtener el nodo TileMap
@onready var tile_map = $tablero

# Detectar eventos de clic del mouse
func _input(event):
	if event.is_action_pressed("click"):
		# Definimos los puntos del rectangulo/tablero
		var p1 = Vector2(3,1)
		var p2 = Vector2(3,6)
		var p3 = Vector2(10,6)
		var p4 = Vector2(10,1)
		
		# Obtener la posición del mouse en la pantalla
		var mouse_pos = get_local_mouse_position()
		# Convertir la posición del mouse a la posición de la celda en la cuadrícula
		var cell_pos = tile_map.local_to_map(mouse_pos)
		# Comprobar si la celda está vacía
		if tile_map.get_cell_source_id(0,cell_pos) == -1 and is_inside_area(cell_pos,p1,p2,p3,p4):
			# Crear un nuevo personaje y añadirlo a la escena
			var character = preload("res://characters/guitarrista1.tscn").instantiate()
			var contenedor = $characters
			character.position = tile_map.map_to_local(cell_pos)
			contenedor.add_child(character)
			print(cell_pos)
			# Establecer el índice de la celda en el mapa de baldosas para indicar que está ocupada por el personaje
			tile_map.set_cell(0,cell_pos)
