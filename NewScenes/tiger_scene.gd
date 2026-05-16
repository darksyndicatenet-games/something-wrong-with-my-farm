extends Node2D

func _ready() -> void:
	z_index = 20
	await get_tree().create_timer(30.0).timeout
	queue_free()
