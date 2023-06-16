extends Area2D
var anim = false
var speed = 1

func _process(_delta):
	#Movement
	position.y -= speed
	if anim == false:
		$AnimationPlayer.play("Dissapear")
		anim=true
	#Screen exit
	if position.y <= -50:
		queue_free()
	

func _destroy():
	queue_free()
