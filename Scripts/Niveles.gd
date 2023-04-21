extends MarginContainer

@onready var practicar = %Practicar
@onready var nivel_1 = %Nivel1
@onready var nivel_2 = %Nivel2
@export var main_scene: PackedScene 

func _ready():
	practicar.pressed.connect(_on_practicar_pressed)
	nivel_1.pressed.connect(_on_nivel_1_pressed)
	nivel_2.pressed.connect(_on_nivel_2_pressed)
	practicar.text = tr("PRAC")
	nivel_1.text = tr("NI1")
	nivel_2.text = tr("NI2")

func _on_practicar_pressed():
	#get_tree().change_scene_to_packed(main_scene)
	get_tree().change_scene_to_file("res://main_scene.tscn")
	
func _on_nivel_1_pressed():
	pass
	
func _on_nivel_2_pressed():
	pass
