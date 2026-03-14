extends CharacterBody2D

@export var speed = 100

var rotation_direction = 0

func _physics_process(_delta):
	get_input()
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
