extends TextureButton



func _ready():
	pressed.connect(on_press)


func on_press():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE*0.9, 0.1)
	tween.tween_property(self, "scale", Vector2.ONE, 0.1)

	
	
