extends Node2D


const AL = preload("res://Scenes/m_arrow_left.tscn")
const AD = preload("res://Scenes/m_arrow_down.tscn")
const AU = preload("res://Scenes/m_arrow_up.tscn")
const AR = preload("res://Scenes/m_arrow_right.tscn")
const HAL = preload("res://Scenes/Hidden_a_left.tscn")
const HAD = preload("res://Scenes/Hidden_a_down.tscn")
const HAU = preload("res://Scenes/Hidden_a_up.tscn")
const HAR = preload("res://Scenes/Hidden_a_right.tscn")
const enemy = preload("res://enemigo.tscn")
const enemylento = preload("res://enemigolento.tscn")
const enemyrapido = preload("res://enemigorapido.tscn")
var character
var chart_level_1 = []
var chart_read = false

@onready var message = $CanvasLayer/Message



@onready var contenedor = $characters
var random = 0
#var random2 = 0
var RNG = RandomNumberGenerator.new()

func _ready():
	#message.show_text("Bienvenido al Nivel %d" % Global.level, 3)
	if Global.level==0:   

		message.show_text(tr("TUTO"), 3.5)

		await get_tree().create_timer(3.8).timeout
		message.show_text(tr("TUTO1"), 4)
		await get_tree().create_timer(4).timeout
		message.show_text(tr("TUTO2"), 4)

		$Training.play() 
		$Training.play()
		$Training.play()

		$Timer.start()
		$Timer2.start()
	elif Global.level==1:
		message.show_text(tr("LEVE1"), 3)
		await get_tree().create_timer(3.8).timeout
		$RockingNight.play()
	elif Global.level == 2:
		message.show_text(tr("LEVE2"), 3)
		await get_tree().create_timer(2.0).timeout
		$SlowLofi.play()


func _process(_delta):
	$Score/Label.text = str(Global.score)
	if !chart_read:
		if Global.level==0:
			read_chart(chart_level_1)
		elif Global.level==1:
			read_chart(Global.chart_level_1)
			read_enemy_spawn(Global.enemy_chart_level_1)
		elif Global.level ==2:
			read_chart(Global.chart_level_2)
			read_enemy_spawn(Global.enemy_chart_level_2)
		chart_read = true
	if Global.shootqueue>0:
		for nodo in contenedor.get_children():
			if nodo.has_method("_on_hit_detected"):
				nodo._on_hit_detected()
		Global.shootqueue -= 1
	
	if Global.posicion_libre != null:
		# Obtener la posición de la celda ocupada por el personaje que murió
		var current_cell_pos = tile_map.local_to_map(Global.posicion_libre)
			# Restablecer la celda como desocupada (-1)
		tile_map.set_cell(0, current_cell_pos, -1)
		Global.posicion_libre = null
	


func _on_timer_timeout():
	if Global.level==0:
		$Timer.start()
		RNG.randomize()
		var random_int = RNG.randi_range(0,4)
		#var random_int2 = RNG.randi_range(0,8)
		random = random_int
		#random2 = random_int2
		
		match random :
			1:
				var al = AL.instantiate()
				get_tree().get_current_scene().add_child(al)
				al.position = $Creator/Marker2D_AL.global_position
				
			2:
				var ad = AD.instantiate()
				get_tree().get_current_scene().add_child(ad)
				ad.position = $Creator/Marker2D_AD.global_position
				

			3:
				var au = AU.instantiate()
				get_tree().get_current_scene().add_child(au)
				au.position = $Creator/Marker2D_AU.global_position
				
			4:
				var ar = AR.instantiate()
				get_tree().get_current_scene().add_child(ar)
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
		var p1 = Vector2(4,2)
		var p2 = Vector2(4,7)
		var p3 = Vector2(12,7)
		var p4 = Vector2(12,2)
		
		# Obtener la posición del mouse en la pantalla
		var mouse_pos = get_local_mouse_position()
		# Convertir la posición del mouse a la posición de la celda en la cuadrícula
		var cell_pos = tile_map.local_to_map(mouse_pos)
		# Comprobar si la celda está vacía
		if tile_map.get_cell_source_id(0,cell_pos) == -1 and is_inside_area(cell_pos,p1,p2,p3,p4) and Global.can_select == 1:
			# Crear un nuevo personaje y añadirlo a la escena
			if Global.focus_char == 'Gallardo':
				character = preload("res://characters/Gallardo.tscn").instantiate()
			elif Global.focus_char == 'Tynic':
				character = preload("res://characters/Tynic.tscn").instantiate()
			elif Global.focus_char == 'Gato':
				character = preload("res://characters/gatoTom.tscn").instantiate()
			character.position = tile_map.map_to_local(cell_pos)
			contenedor.add_child(character)
			tile_map.set_cell(0,cell_pos,0,Vector2i(0, 0))
			Global.can_select = 0
			Global.posicion_libre= null





func _on_timer_2_timeout():
	$Timer2.start()
	RNG.randomize()
	var random_int = RNG.randi_range(0,4)
	#var random_int2 = RNG.randi_range(0,8)
	random = random_int
	#random2 = random_int2
	if Global.level==0:
		match random :
			1:
				var en1 = enemy.instantiate()
				get_tree().get_current_scene().add_child(en1)
				en1.position = $Creator/Marker2D_en1.global_position
			2:
				var en2 = enemy.instantiate()
				get_tree().get_current_scene().add_child(en2)
				en2.position = $Creator/Marker2D_en2.global_position
			3:
				var en3 = enemy.instantiate()
				get_tree().get_current_scene().add_child(en3)
				en3.position = $Creator/Marker2D_en3.global_position
			4:
				var en4 = enemy.instantiate()
				get_tree().get_current_scene().add_child(en4)
				en4.position = $Creator/Marker2D_en4.global_position



func _on_texture_button_2_pressed():
	Global.focus_char = 'Gallardo'
	Global.can_select = 1
	$Select_Gallardo.play(0.2)
	

func _on_texture_button_pressed():
	Global.focus_char = 'Tynic'
	Global.can_select = 1
	$Select_Tynic.play(0.15)



#Funcion para crear notas automaticamente
func create_note(lane):
	match lane:
		"left":
			var al = AL.instantiate()
			get_tree().get_current_scene().add_child(al)
			al.position = $Creator/Marker2D_AL.global_position
		"down":
			var ad = AD.instantiate()
			get_tree().get_current_scene().add_child(ad)
			ad.position = $Creator/Marker2D_AD.global_position
		"up":
			var au = AU.instantiate()
			get_tree().get_current_scene().add_child(au)
			au.position = $Creator/Marker2D_AU.global_position
		"right":
			var ar = AR.instantiate()
			get_tree().get_current_scene().add_child(ar)
			ar.position = $Creator/Marker2D_AR.global_position
		"hleft":
			var hal = HAL.instantiate()
			get_tree().get_current_scene().add_child(hal)
			hal.position = $Creator/Marker2D_AL.global_position
		"hright":
			var har = HAR.instantiate()
			get_tree().get_current_scene().add_child(har)
			har.position = $Creator/Marker2D_AR.global_position
		"hup":
			var hau = HAU.instantiate()
			get_tree().get_current_scene().add_child(hau)
			hau.position = $Creator/Marker2D_AU.global_position
		"hdown":
			var had = HAD.instantiate()
			get_tree().get_current_scene().add_child(had)
			had.position = $Creator/Marker2D_AD.global_position

#Funcion para meter delay entre notas

#Funcion lectora de sheets
func read_chart(chart):
	for i in chart:
		if i is String:
			create_note(i)
		else:
			$NoteDelay.start(i)
			await $NoteDelay.timeout


func _on_texture_button_3_pressed():
	Global.focus_char = 'Gato'
	Global.can_select = 1
	$Select_Gato.play()
	
func create_enemy(lane):
	match lane:
		"a":
			var en1 = enemy.instantiate()
			get_tree().get_current_scene().add_child(en1)
			en1.position = $Creator/Marker2D_en1.global_position
		"b":
			var en2 = enemy.instantiate()
			get_tree().get_current_scene().add_child(en2)
			en2.position = $Creator/Marker2D_en2.global_position
		"c":
			var en3 = enemy.instantiate()
			get_tree().get_current_scene().add_child(en3)
			en3.position = $Creator/Marker2D_en3.global_position
		"d":
			var en4 = enemy.instantiate()
			get_tree().get_current_scene().add_child(en4)
			en4.position = $Creator/Marker2D_en4.global_position
		"e":
			var enL1 = enemylento.instantiate()
			get_tree().get_current_scene().add_child(enL1)
			enL1.position = $Creator/Marker2D_en1.global_position
		"f":
			var enL2 = enemylento.instantiate()
			get_tree().get_current_scene().add_child(enL2)
			enL2.position = $Creator/Marker2D_en2.global_position
		"g":
			var enL3 = enemylento.instantiate()
			get_tree().get_current_scene().add_child(enL3)
			enL3.position = $Creator/Marker2D_en3.global_position
		"h":
			var enL4 = enemylento.instantiate()
			get_tree().get_current_scene().add_child(enL4)
			enL4.position = $Creator/Marker2D_en4.global_position
		"i":
			var enR1 = enemyrapido.instantiate()
			get_tree().get_current_scene().add_child(enR1)
			enR1.position = $Creator/Marker2D_en1.global_position
		"j":
			var enR2 = enemyrapido.instantiate()
			get_tree().get_current_scene().add_child(enR2)
			enR2.position = $Creator/Marker2D_en2.global_position
		"k":
			var enR3 = enemyrapido.instantiate()
			get_tree().get_current_scene().add_child(enR3)
			enR3.position = $Creator/Marker2D_en3.global_position
		"l":
			var enR4 = enemyrapido.instantiate()
			get_tree().get_current_scene().add_child(enR4)
			enR4.position = $Creator/Marker2D_en4.global_position

func read_enemy_spawn(enemy_chart):
	if Global.level==1 or Global.level==2:
		for i in enemy_chart:
			if i is String:
				create_enemy(i)
			else:
				$EnemyDelay.start(i)
				await $EnemyDelay.timeout
		await get_tree().create_timer(24).timeout
		get_tree().change_scene_to_file("res://Scenes/WinLv1.tscn")
