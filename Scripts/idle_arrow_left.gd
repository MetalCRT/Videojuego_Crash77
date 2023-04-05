extends Area2D

@onready var anim = $AnimationPlayer
var sensor = 0

func _process(delta):
	#Hit Note
	if sensor == 1:
		if Input.is_action_just_pressed("ui_left"):
			anim.play("Hit")
			anim.animation_set_next("Miss","RESET")
	
	#Miss Note
	if sensor == 0:
		if Input.is_action_just_pressed("ui_left"):
			anim.play("Miss")
			anim.animation_set_next("Hit","RESET")
			



func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	sensor = 1
	Global.sensor_ArrowLeft = 1

func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	sensor = 0
	Global.sensor_ArrowLeft = 0
