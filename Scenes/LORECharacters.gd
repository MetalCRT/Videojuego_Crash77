extends MarginContainer
@onready var buttonback = %buttonback
@onready var gallardoo = %Gallardoo
@onready var tynicc = %Tynicc
@onready var tomyy = %Tomyy
@onready var parlantinn = %Parlantinn
@onready var loree = %Loree

# Called when the node enters the scene tree for the first time.
func _ready():
	buttonback.pressed.connect(_on_buttonback_pressed)
	gallardoo.pressed.connect(_on_gallardoo_pressed)
	tynicc.pressed.connect(_on_tynicc_pressed)
	tomyy.pressed.connect(_on_tomyy_pressed)
	parlantinn.pressed.connect(_on_parlantinn_pressed)
	
func _on_buttonback_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	
func _on_gallardoo_pressed():
	loree.show_text(tr("GALLARDO"))
	update_rich_text(tr("GALLARDO"))
	
func _on_tynicc_pressed():
	loree.show_text(tr("TYNIC"))
	update_rich_text(tr("TYNIC"))
	
func _on_tomyy_pressed():
	loree.show_text(tr("TOMMY"))
	update_rich_text(tr("TOMMY"))
	
func _on_parlantinn_pressed():
	loree.show_text(tr("GALLARDO"))
	update_rich_text(tr("GALLARDO"))
	
func update_rich_text(text: String):
	loree.bbcode_text = text
	
	
