extends MarginContainer
@onready var buttonback = %buttonback
@onready var gallardoo = %Gallardoo
@onready var tynicc = %Tynicc
@onready var tomyy = %Tomyy
@onready var parlantinn = %Parlantinn
@onready var loree = %Loree
@onready var panel = %Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	buttonback.pressed.connect(_on_buttonback_pressed)
	gallardoo.pressed.connect(_on_gallardoo_pressed)
	tynicc.pressed.connect(_on_tynicc_pressed)
	tomyy.pressed.connect(_on_tomyy_pressed)
	parlantinn.pressed.connect(_on_parlantinn_pressed)
	loree.text = "[center]" + "[tornado]" + tr("LOREEE")
	
func _on_buttonback_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	
func _on_gallardoo_pressed():
	loree.text = "[center]"+ "[color=green]" + tr("GALLARDO") + "[/color]"
	
func _on_tynicc_pressed():
	loree.text = "[center]"+ "[color=blue]"+ tr("TYNIC") + "[/color]"
	
func _on_tomyy_pressed():
	loree.text = "[center]"+"[color=orange]"+ tr("TOMMY") + "[/color]"
	
func _on_parlantinn_pressed():
	loree.text = "[center]"+ tr("PARLANTIN")
	
func update_rich_text(text: String):
	loree.bbcode_text = text

