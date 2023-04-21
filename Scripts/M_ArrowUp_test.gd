extends Area2D

const TARGET_Y = 96
const SPAWN_Y = 700
const DISTANCE_TO_TARGET = TARGET_Y-SPAWN_Y

const UP_SPAWN = Vector2(276,SPAWN_Y)

var speed = 0
var hit = false

func _physics_process(delta):
	#Movement
	if !hit:
		position.y -= speed*delta
		if position.y <= -50: #Screen exit
			queue_free()
			Global.score -=10
	else:
		$Node2D.position.y += speed*delta
	
func initialize():
	position = Vector2(276,700)
	speed = -DISTANCE_TO_TARGET/2.0

func destroy():
	$Timer.start()
	hit = true




func _on_timer_timeout():
	queue_free()
