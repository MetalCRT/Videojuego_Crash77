extends Area2D

@onready var anim = $AnimationPlayer
var current_note = null

func _process(delta):
	#Hit Note
	if current_note != null:
		if Input.is_action_just_pressed("ui_up"):
			#emit_signal("hit_detected")
			anim.play("Hit")
			anim.animation_set_next("Miss","RESET")
			Global.score += 10
			Global.shootqueue += 1
			current_note.destroy()
	
	#Miss Note
	if current_note == null:
		if Input.is_action_just_pressed("ui_up"):
			anim.play("Miss")
			anim.animation_set_next("Hit","RESET")

func _on_area_shape_entered(area):
	if area.is_in_group("m_arrow_up_test"):
		current_note = area



func _on_area_shape_exited(area):
	if area.is_in_group("m_arrow_up_test"):
		current_note = area
