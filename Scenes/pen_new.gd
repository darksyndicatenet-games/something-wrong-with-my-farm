extends Node2D

@export var animal_scenes: Array[PackedScene]
var is_spawn_bunnny : bool = false
@onready var pen_points = $SpawnPoints.get_children()


func get_random_pen_point() -> Vector2:
	var point = pen_points[randi() % pen_points.size()]
	return point.global_position
