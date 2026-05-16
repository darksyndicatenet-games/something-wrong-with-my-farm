extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = 20
	await get_tree().create_timer(40.0).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_static_body_2d_body_entered(body: Node2D) -> void:

	if body.name == "Player" and Globals.can_collect_more_bunnies == false:
		print("Player entered bunny area")
		Globals.bunny_track += 1
		Globals.can_collect_more_bunnies = true
		print("Collected Bunnies: ", Globals.bunny_track)
		player_collided_with_animal()


func player_collided_with_animal():
	queue_free()
