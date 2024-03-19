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
	
	
	if health <= 0:
		player_alive = false # do dodania game over screen xdd
		health = 0
		print("ale zgon")
		self.queue_free()

func player():
	pass





