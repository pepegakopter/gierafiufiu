extends Area2D

var entered = false

func _on_body_entered(body: CharacterBody2D):
	entered = true


func _on_body_exited(body):
	entered = false


func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interakcja"):
			print("siema")
			get_tree().change_scene_to_file("res://sceny/bossroom.tscn")
