extends MarginContainer

@onready var reanudar = %Reanudar
@onready var reiniciar = %Reiniciar
@onready var menu_principal = %"Menu Principal"
@onready var salir = %Salir


# Called when the node enters the scene tree for the first time.
func _ready():
	reanudar.pressed.connect(_on_reanudar_pressed)
	reiniciar.pressed.connect(_on_reiniciar_pressed)
	menu_principal.pressed.connect(_on_menu_principal_pressed)
	salir.pressed.connect(_on_salir_pressed)
	hide()
	
func _input(event):
	if  event.is_action_pressed("pausa"):
		show()
		get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_reanudar_pressed():
	get_tree().paused = false
	hide()
	
	
func _on_reiniciar_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	Global.score = 0
	
	
func _on_menu_principal_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	get_tree().paused = false
	
func _on_salir_pressed():
	# Se ejecuta cuando se presiona el botón "Salir"
	get_tree().quit()
