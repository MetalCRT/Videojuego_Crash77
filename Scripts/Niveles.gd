extends MarginContainer

@onready var practicar = %Practicar
@onready var nivel_1 = %Nivel1
@onready var nivel_2 = %Nivel2
#@export var main_scene: PackedScene 
@onready var niveles = %Niveles
@onready var buttonback = %buttonback

#mi duda es si un textrichlabeel sirve para cuando camvie el idioma 


func _ready():
	practicar.pressed.connect(_on_practicar_pressed)
	nivel_1.pressed.connect(_on_nivel_1_pressed)
	nivel_2.pressed.connect(_on_nivel_2_pressed)
	niveles.text = "[center][tornado]"+ tr("SEL")
	nivel_1.text = tr("NI1")
	nivel_2.text = tr("NI2")
	buttonback.pressed.connect(_on_buttonback_pressed)

func _on_practicar_pressed():
	#get_tree().change_scene_to_packed(main_scene)
	get_tree().change_scene_to_file("res://main_scene.tscn")
	Global.level=0
	
func _on_nivel_1_pressed():
	get_tree().change_scene_to_file("res://main_scene.tscn")
	Global.level=1
func _on_nivel_2_pressed():
	pass
	
func _on_buttonback_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
