extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot = $Pivot
var velocityInt = -30
var velocityVect = Vector2(velocityInt,0)
const HEALTH = 4
var health = HEALTH

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	position += velocityVect*delta
	#move_and_slide()
	if abs(velocityInt) > 0:
		playback.travel("caminando")
	else:
		playback.travel("idle")




func _on_area_entered(area):
	if area.is_in_group("proyectiles"):
		health -= 1 # reduce la salud del enemigo en 1
		if health <= 0:
			$AnimationPlayer.play("rip")
			await $AnimationPlayer.animation_finished
			queue_free() 
