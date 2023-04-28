extends Area2D
signal hit
@onready var animation_player = $AnimationPlayer
#@onready var animation_tree = $AnimationTree
#@onready var playback = animation_tree.get("parameters/playback")
#@onready var pivot = $Pivot
@onready var posicion = position
# Añade esta línea en el método _ready() para conectar la señal con el método correspondiente
var enemies= []
var max_timer = 1
var current_timer = 1
	

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	body_entered.connect(_on_enemy_body_entered)
	
func _physics_process(delta):
	if enemies.size()>0 and current_timer >= max_timer:
		fire()
		current_timer=0
	current_timer += delta

func _on_enemy_body_entered(body):
	if body.is_in_group("enemies"):
		$AnimationPlayer.play("explosion")
		await $AnimationPlayer.animation_finished
		queue_free() 
	else:
		$AnimationPlayer.play("idle")


func _on_body_entered(body):
	enemies.append(body)

	
func _on_body_exited(body):
	if body in enemies:
		enemies.erase(body)
		
func fire():
			# Crea  proyectil y lo agrega como un hermano del personaje
	var nota = preload("res://characters/nota.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion
	

