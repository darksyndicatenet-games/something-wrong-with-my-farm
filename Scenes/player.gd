extends CharacterBody2D

@export var speed = 100
@export var info_hud = MarginContainer

var rotation_direction = 0
var meat = 0
var coins = 0
var animals = 0
var wheat = 0

func _physics_process(_delta):
	get_input()
	if info_hud:
		info_hud.update_display(meat, coins, animals, wheat)
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
