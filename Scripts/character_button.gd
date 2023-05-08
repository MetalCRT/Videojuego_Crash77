extends TextureButton

@export var color:Color
@onready var progress_bar = $ProgressBar

func _ready():
	pressed.connect(on_press)
	progress_bar.modulate = color


func on_press():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE*0.9, 0.1)
	tween.tween_property(self, "scale", Vector2.ONE, 0.1)

	
	
