extends TextureButton

@export var color:Color
@onready var progress_bar = $ProgressBar
@export var cooldown = 1
@onready var timer = $Timer

func _ready():
	pressed.connect(on_press)
	progress_bar.modulate = color
	timer.wait_time = cooldown
	timer.start()
	disabled = true
	timer.timeout.connect(on_timeout)
	progress_bar.max_value = cooldown

func on_timeout() :
	disabled = false
	
func _process(_delta):
	progress_bar.value = cooldown - timer.time_left
	
func on_press():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE*0.9, 0.1)
	tween.tween_property(self, "scale", Vector2.ONE, 0.1)
	disabled = true
	timer.start()
	
	
