extends Node2D

const AL = preload("res://Scenes/m_arrow_left.tscn")
const AD = preload("res://Scenes/m_arrow_down.tscn")
const AU = preload("res://Scenes/m_arrow_up.tscn")
const AR = preload("res://Scenes/m_arrow_right.tscn")

var random = 0
var RNG = RandomNumberGenerator.new()
var deltaTime = 0

func _process(delta):
	deltaTime = delta
	print(deltaTime)


func _on_timer_timeout():
	$Timer.start()
	$Timer.set_wait_time(1000/9*deltaTime)
	RNG.randomize()
	var random_int = RNG.randi_range(0,4)
	random = random_int
	
	match random :
		1:
			var al = AL.instantiate()
			get_parent().add_child(al)
			al.position = $Creator/Marker2D_AL.global_position
		2:
			var ad = AD.instantiate()
			get_parent().add_child(ad)
			ad.position = $Creator/Marker2D_AD.global_position
		3:
			var au = AU.instantiate()
			get_parent().add_child(au)
			au.position = $Creator/Marker2D_AU.global_position
		4:
			var ar = AR.instantiate()
			get_parent().add_child(ar)
			ar.position = $Creator/Marker2D_AR.global_position
