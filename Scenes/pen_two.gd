extends Node2D
class_name GamePen # This registers 'GamePen' as an official type in Godot 4!

@onready var detection_area: Area2D = $Area2D

## Public function that your manager can call to check occupancy
func is_occupied() -> bool:
	# has_overlapping_bodies() is a built-in Godot 4 function.
	# It instantly returns true if any physics body is sitting inside the shape.
	return detection_area.has_overlapping_bodies()

## Public function to handle adding an object to this specific pen
func occupy_pen(object_to_add: Node2D) -> void:
	print("Adding object to pen: ", name)
	# Snap the incoming item directly to this pen's central coordinates
	object_to_add.global_position = global_position
	add_child(object_to_add)
