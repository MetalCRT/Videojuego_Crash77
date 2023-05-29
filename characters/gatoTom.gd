extends Area2D
signal hit
@onready var animation_player = $AnimationPlayer
@onready var posicion = position
var enemies_up =[]
var enemies_down=[]
var enemies_center=[]
var max_timer = 1
var current_timer = 1
# Añade esta línea en el método _ready() para conectar la señal con el método correspondiente
func _ready():
	$centro.body_entered.connect(_on_body_entered_center)
	$arriba.body_entered.connect(_on_body_entered_up)
	$abajo.body_entered.connect(_on_body_entered_down)
	body_entered.connect(_on_body_entered)
	$AnimationPlayer.play("idle")
	
func _physics_process(delta):
	if enemies_up.size()>0 and current_timer >= max_timer:
		fire_up()
		current_timer=0
	if enemies_center.size()>0 and current_timer >= max_timer:
		fire_center()
		current_timer=0
	if enemies_down.size()>0 and current_timer >= max_timer:
		fire_down()
		current_timer=0
	current_timer += delta

func fire_up():
	var nota = preload("res://characters/notaTeclado.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion - Vector2(0,32)

func fire_center():
	var nota = preload("res://characters/notaTeclado.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion

func fire_down():
	var nota = preload("res://characters/notaTeclado.tscn").instantiate()
	get_parent().add_child(nota)
	nota.position = posicion + Vector2(0,32)

func death():
		$AnimationPlayer.play("explosion")
		await $AnimationPlayer.animation_finished
		Global.posicion_libre = Vector2(posicion)
		print(Global.posicion_libre)
		if is_instance_valid(self): 
			queue_free() 

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body._damage(self)
		$AnimationPlayer.play("idle") #cambiar a daño
	else:
		$AnimationPlayer.play("idle")
		

func _on_body_entered_up(body):
	enemies_up.append(body)
	
func _on_body_entered_center(body):
	enemies_center.append(body)
	
func _on_body_entered_down(body):
	enemies_down.append(body)
