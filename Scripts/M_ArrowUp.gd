extends Area2D

var speed = 1

func _process(delta):
	#Movement
	position.y -= speed
	
	if position.y <= -50:
		queue_free()
		print("Adios")


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	pass # Replace with function body.


func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	pass # Replace with function body.
