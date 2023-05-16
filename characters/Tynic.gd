extends Area2D
signal hit
@onready var animation_player = $AnimationPlayer
#@onready var animation_tree = $AnimationTree
#@onready var playback = animation_tree.get("parameters/playback")
#@onready var pivot = $Pivot
@onready var posicion = position
# Añade esta línea en el método _ready() para conectar la señal con el método correspondiente
func _ready():
	$AnimationPlayer.play("idle")
	
func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body._damage(self)
		$AnimationPlayer.play("daño")
	else:
		$AnimationPlayer.play("idle")


func _on_hit_detected():
	# Crea  proyectil y lo agrega como un hijo del personaje
	var nota = preload("res://characters/notaGuita2.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion

func death():
		$AnimationPlayer.play("explosion")
		await $AnimationPlayer.animation_finished
		Global.posicion_libre = Vector2(posicion)
		print(Global.posicion_libre)
		#emit_signal("character_died")
		queue_free() 
