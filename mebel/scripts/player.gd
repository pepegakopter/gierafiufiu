extends CharacterBody2D

@export var speed = 100
var enemy_attack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var attack_ip = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	enemy_attack()
	
	if health <= 0:
		player_alive = false # do dodania game over screen xdd
		health = 0
		print("ale zgon")
		self.queue_free()

func player():
	pass




func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_attack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_attack_range = false

func enemy_attack():
	if enemy_attack_range and enemy_attack_cooldown == true:
		health = health - 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)
	



func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
	
func attack():
	if Input.is_action_just_pressed("attack"):
		global.player_current_attack = true
		
