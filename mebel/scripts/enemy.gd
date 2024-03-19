extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

var health = 100
var player_attack_zone = false

func _physics_process(delta):  # movement za graczem
	if player_chase:
		position += (player.position - position) / speed
		move_and_collide(Vector2(0,0))
		
func enemy():
	pass

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false



