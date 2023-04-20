extends Area2D

const TARGET_Y = 96
const SPAWN_Y = 700
const DISTANCE_TO_TARGET = TARGET_Y-SPAWN_Y

const LEFT_SPAWN = Vector2(54, SPAWN_Y)
const DOWN_SPAWN = Vector2(165,SPAWN_Y)
const UP_SPAWN = Vector2(276,SPAWN_Y)
const RIGHT_SPAWN = Vector2(287,SPAWN_Y)

var speed = 0 
var hit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !hit:
		position.y -=speed*delta
		if position.y<= -50:
			queue_free()
			get_parent().reset_combo()
		else:
			$Node2D.position.y += speed*delta
			
func initialize(lane):
	if lane == 0:
		$arrowSprites.frame = 0
		position = LEFT_SPAWN
	elif lane == 1:
		$arrowSprites.frame = 1
		position = DOWN_SPAWN
	elif lane == 2:
		$arrowSprites.frame = 2
		position = UP_SPAWN
	elif lane == 3:
		$arrowSprites.frame = 3
		position = RIGHT_SPAWN
	else:
		print("Spawn incorrecto")
		return
	speed = DISTANCE_TO_TARGET / 2.0
	
func destroy(score):
	$arrowSprites.visible = false
	$timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "GREAT"
		$Node2D/Label.modulate = Color("f6d6bd")
	elif score == 2:
		$Node2D/Label.text = "GOOD"
		$Node2D/Label.modulate = Color("c3a38a")
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		$Node2D/Label.modulate = Color("997577")

func _on_timer_timeout():
	queue_free()
