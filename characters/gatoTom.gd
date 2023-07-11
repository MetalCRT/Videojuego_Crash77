extends Area2D
signal hit
@onready var animation_player = $AnimationPlayer
@onready var posicion = position
var enemies_center=[]
var max_timer = 2
var current_timer = 2
# Añade esta línea en el método _ready() para conectar la señal con el método correspondiente
func _ready():
	$centro.body_entered.connect(_on_body_entered_center)
	body_entered.connect(_on_body_entered)
	$AnimationPlayer.play("spawn")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("idle")
	
func _physics_process(delta):
	if enemies_center.size()>0 and current_timer >= max_timer:
		fire_center(0)
		fire_center(32)
		fire_center(-32)
		current_timer=0
	current_timer += delta

func fire_center(y):
	var nota = preload("res://characters/notaTeclado.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion + Vector2(0,y)

func death():
		$AnimationPlayer.play("explosion")
		$Boom.play()
		await $AnimationPlayer.animation_finished
		Global.posicion_libre = Vector2(posicion)
		print(Global.posicion_libre)
		if is_instance_valid(self): 
			queue_free() 

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body._damage(self)
		$AnimationPlayer.play("daño") #cambiar a daño
	else:
		$AnimationPlayer.play("idle")
		
func _on_body_entered_center(body):
	enemies_center.append(body)
