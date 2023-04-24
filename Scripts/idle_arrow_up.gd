extends Area2D

@onready var anim = $AnimationPlayer
var sensor = 0
var current_note = null
var sec_note = null

func _process(delta):
	#Hit Note
	if current_note == null && sec_note != null:
		current_note = sec_note 
		sec_note = null
	if current_note != null:
		if Input.is_action_just_pressed("ui_up"):
			anim.play("Hit")
			anim.animation_set_next("Miss","RESET")
			Global.score += 10
			Global.shootqueue += 1
			current_note._destroy()
	
	#Miss Note
	if current_note == null:
		if Input.is_action_just_pressed("ui_up"):
			anim.play("Miss")
			anim.animation_set_next("Hit","RESET")

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if current_note == null:
		current_note = area
	else:
		sec_note = area
		

func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	current_note = null
