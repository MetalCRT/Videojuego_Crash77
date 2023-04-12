extends MarginContainer

@onready var inicio = %Inicio
@onready var exit = %Exit


func _ready():
	# Se ejecuta al inicio de la escena
	inicio.pressed.connect(_on_inicio_pressed)
	exit.pressed.connect(_on_exit_pressed)
	

func _on_inicio_pressed():
	# Se ejecuta cuando se presiona el botón "Iniciar"
	get_tree().change_scene_to_file("res://main_scene.tscn")

func _on_exit_pressed():
	# Se ejecuta cuando se presiona el botón "Salir"
	get_tree().quit()
