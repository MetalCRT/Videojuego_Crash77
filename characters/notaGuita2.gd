extends Area2D
const PROJECTILE_SPEED = 30
var projectile_count = 0
var velocityVect = Vector2(PROJECTILE_SPEED, 0)

func _ready():
	get_tree().create_timer(2).timeout.connect(queue_free)

func _physics_process(delta):
	position += velocityVect*delta

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		queue_free() # destruye el proyectil después de hacer daño
