extends MarginContainer

@onready var lenguajes = %Lenguajes
@onready var atras = %Atras

func _ready():
	# Se ejecuta al inicio de la escena
	lenguajes.pressed.connect(_on_lenguajes_pressed)
	atras.pressed.connect(_on_atras_pressed)


func _on_lenguajes_pressed():
	# Se ejecuta cuando se presiona el botón "Iniciar"
	# get_tree().change_scene_to_file("res://main_scene.tscn")
	get_tree().change_scene_to_file("res://Scenes/Lenguajes.tscn")

	
func _on_atras_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


