extends Area2D

@onready var anim = $AnimationPlayer
var current_note = null
var sec_note = []

func _process(_delta):
	#Hit Note
	if current_note == null && len(sec_note) != 0:
		current_note = sec_note.pop_front()
	if current_note != null:
		if Input.is_action_just_pressed("down_arrow"):
			anim.play("Hit")
			anim.animation_set_next("Miss","RESET")
			Global.score += 10
			Global.shootqueue += 1
			current_note._destroy()
	
	#Miss Note
	if current_note == null:
		if Input.is_action_just_pressed("down_arrow"):
			anim.play("Miss")
			anim.animation_set_next("Hit","RESET")

func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	if current_note == null:
		current_note = area
	else:
		sec_note.push_back(area)

func _on_area_shape_exited(_area_rid, _area, _area_shape_index, _local_shape_index):
	current_note = null
