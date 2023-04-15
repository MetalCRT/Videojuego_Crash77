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

#func _ready():
#	set_process_input(true)
#	var flechaAbajo=load("res://Scenes/idle_arrow_down.tscn").instantiate()
#	flechaAbajo.hit_detected.connect(self._on_hit_detected).instantiate()
#	var flechaArriba=load("res://Scenes/idle_arrow_up.tscn").instantiate()
#	flechaArriba.hit_detected.connect(self._on_hit_detected).instantiate()
#	var flechaIzq=load("res://Scenes/idle_arrow_left.tscn").instantiate()
#	flechaIzq.hit_detected.connect(self._on_hit_detected).instantiate()
#	var flechaDer=load("res://Scenes/idle_arrow_right.tscn").instantiate()
#	flechaDer.hit_detected.connect(self._on_hit_detected).instantiate()
#	get_node("res://Scenes/idle_arrow_left.tscn").hit_detected.connect(self._on_hit_detected).instantiate()
#	get_node("res://Scenes/idle_arrow_right.tscn").hit_detected.connect(self._on_hit_detected).instantiate()
#	get_node("res://Scenes/idle_arrow_up.tscn").hit_detected.connect(self._on_hit_detected).instantiate()


func _on_hit_detected():
	# Crea  proyectil y lo agrega como un hijo del personaje
	var nota = preload("res://characters/nota.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion
	#print("Dispara")

#func _process(delta):
#	if Global.shootqueue > 0:
#		_on_hit_detected()
#		Global.shootqueue -= 1
