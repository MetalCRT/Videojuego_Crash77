extends Node2D

const note = preload("res://Scenes/m_arrow_up_test.tscn")
var instance
var RNG = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _spawn_notes():
	instance = note.instantiate()
	instance.initialize()
	add_child(instance)


func _on_timer_timeout():
	$Timer.start()
	RNG.randomize()
	var random_int = RNG.randi_range(0,1)
	var random = random_int
	match random:
		1: _spawn_notes()
