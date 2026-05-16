extends Node2D

func _ready() -> void:
	z_index = 20
	await get_tree().create_timer(30.0).timeout
	queue_free()
	
func _physics_process(_delta: float) -> void:
	pass

func _on_static_body_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and Globals.can_collect_more_tiger == false:
		print("Player entered tiger area")
		Globals.tiger_track += 1
		Globals.can_collect_more_tiger = true
		print("Collected Tiger: ", Globals.tiger_track)
		player_collided_with_animal()


func player_collided_with_animal():
	queue_free()
