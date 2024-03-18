extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

var health = 100
var player_attack_zone = false

func _physics_process(delta):  # movement za graczem
	deal_with_dmg()
	
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






func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_attack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_attack_zone = false
		
func deal_with_dmg():
	if player_attack_zone and global.player_current_attack == true:
		health = health - 20
		print("hp potwora = ", health)
		if health <= 0:
			self.queue_free()
