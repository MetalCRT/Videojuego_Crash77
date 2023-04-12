extends Area2D
const PROJECTILE_SPEED = 50
var projectile_count = 0
var velocityVect = Vector2(PROJECTILE_SPEED, 0)

func _physics_process(delta):
	position += velocityVect*delta
func _on_body_entered(body):
	if body.is_in_group("enemies"):
		queue_free() # destruye el proyectil después de hacer daño
