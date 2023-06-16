extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	
