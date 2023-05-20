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
	pass
	
func _on_selector_pressed():
	pass
	
func _on_menu_principal_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	
