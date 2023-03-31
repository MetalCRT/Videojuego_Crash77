extends Area2D

var speed = 1
var sensor = 0

func _process(delta):
	#Movement
	position.y -= speed
	
	#Screen exit
	if position.y <= -50:
		print("Adios")
		queue_free()
	
	#Hit detection
	if sensor == 1:
		if Global.sensor_ArrowUp == 1:
			if Input.is_action_just_pressed("ui_up"):
				queue_free()



func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	sensor = 1


func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	sensor = 0
