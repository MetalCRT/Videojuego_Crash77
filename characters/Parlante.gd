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
	else:
		$AnimationPlayer.play("idle")

func death():
		var ataque = preload("res://characters/ataqueParlante.tscn").instantiate()
		get_parent().add_child(ataque)
		ataque.position = posicion
		await get_tree().create_timer(0.1).timeout
		get_parent().add_child(ataque)
		ataque.position = posicion
		await get_tree().create_timer(0.1).timeout
		get_parent().add_child(ataque)
		ataque.position = posicion
		await get_tree().create_timer(0.1).timeout
		get_parent().add_child(ataque)
		ataque.position = posicion
		await get_tree().create_timer(0.1).timeout
		get_parent().add_child(ataque)
		ataque.position = posicion
		await get_tree().create_timer(0.1).timeout
		$AnimationPlayer.play("explosion")
		await $AnimationPlayer.animation_finished
		queue_free() 
