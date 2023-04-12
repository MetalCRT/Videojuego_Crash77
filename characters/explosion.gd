extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot = $Pivot

func show_and_play_animation():
	# Establecer el nodo como visible
	# Reproducir la animación
	$AnimationPlayer.play("explosion")
	
# Hacer que el nodo desaparezca y detener la animación
func hide_and_stop_animation():
	# Detener la animación
	$AnimationPlayer.stop("explosion")
	
	# Establecer el nodo como invisible
	hide()
