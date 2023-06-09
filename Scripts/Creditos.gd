extends CanvasLayer

@onready var buttonback = %buttonback

# Called when the node enters the scene tree for the first time.
func _ready():
	buttonback.pressed.connect(_on_buttonback_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_buttonback_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
