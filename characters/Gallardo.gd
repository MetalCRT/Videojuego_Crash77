extends Area2D
signal hit
@onready var animation_player = $AnimationPlayer
#@onready var animation_tree = $AnimationTree
#@onready var playback = animation_tree.get("parameters/playback")
#@onready var pivot = $Pivot
@onready var posicion = position
# Añade esta línea en el método _ready() para conectar la señal con el método correspondiente
	
func _on_body_entered(body):
	if body.is_in_group("enemies"):
		$AnimationPlayer.play("explosion")
		await $AnimationPlayer.animation_finished
		queue_free() 
	else:
		$AnimationPlayer.play("idle")


func _on_hit_detected():
	# Crea  proyectil y lo agrega como un hermano del personaje
	var nota = preload("res://characters/nota.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion
	#print("Dispara")
	


#func _process(delta):
#	if Global.shootqueue > 0:
#		_on_hit_detected()
#		Global.shootqueue -= 1


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
		# Crea  proyectil y lo agrega como un hermano del personaje
	var nota = preload("res://characters/nota.tscn").instantiate()
	await get_tree().create_timer(3).timeout
	get_parent().add_child(nota)
	nota.position = posicion

