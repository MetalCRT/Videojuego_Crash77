extends MarginContainer

@onready var reintentar = %Reintentar
@onready var selector = %Selector
@onready var menu_principal = %"Menu Principal"


# Called when the node enters the scene tree for the first time.
func _ready():

	reintentar.pressed.connect(_on_reintentar_pressed)
	selector.pressed.connect(_on_selector_pressed)
	menu_principal.pressed.connect(_on_menu_principal_pressed)

func _on_reintentar_pressed():
	if Global.level==0:
		get_tree().change_scene_to_file("res://main_scene.tscn")
		get_tree().paused = false
		Global.score = 0
	elif Global.level==1:
		get_tree().change_scene_to_file("res://Scenes/main_scene_level1.tscn")
		get_tree().paused = false
		Global.score = 0
	
func _on_selector_pressed():
	get_tree().change_scene_to_file("res://Scenes/Niveles.tscn")
	Global.score = 0
func _on_menu_principal_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	Global.score = 0
	
