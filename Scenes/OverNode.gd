extends Area2D

@onready var punto_final = $"."
@onready var collision_shape_2d = %CollisionShape2D

func _ready():
	pass 
	
func _on_body_entered(body):
	if body.is_in_group("enemies"):
		# Realizar acciones de game over aquí
		get_tree().change_scene_to_file("res://Scenes/Gameover.tscn")




