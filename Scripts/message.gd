extends PanelContainer


@onready var label = $MarginContainer/Label

func _ready():
	hide()

func show_text(text: String, seconds: float):
	label.text = text
	show()
	await get_tree().create_timer(seconds).timeout
	hide()

