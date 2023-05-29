extends Area2D

var speed = 1

func _process(_delta):
	#Movement
	position.y -= speed
	
	#Screen exit
	if position.y <= -50:
		queue_free()
	

func _destroy():
	queue_free()
