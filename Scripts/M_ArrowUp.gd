extends Area2D

var speed = 1

func _process(delta):
	#Movement
	position.y -= speed
	
	if position.y <= -50:
		queue_free()
		print("Adios")
