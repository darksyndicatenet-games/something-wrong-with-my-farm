extends Node2D


var player_inside = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("click") and Globals.tiger_phase == 3 and Globals.tiger_spawned == true:
		Globals.meat += 1
		print("Meat: ", Globals.meat)
		Globals.tiger_spawned = false


func _on_pen_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = true


func _on_pen_2_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = false
