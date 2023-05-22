extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(on_press)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_press():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE*0.9, 0.1)
	tween.tween_property(self, "scale", Vector2.ONE, 0.1)
