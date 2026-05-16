extends Node2D

@export var PetScene: PackedScene

signal pet_spawned

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("pet_spawned")
		print("eh")
		#spawn_pet()
#
#
#func spawn_pet():
	#var spawn_points = get_tree().get_nodes_in_group("pet_spawn")
#
	#if spawn_points.size() == 0:
		#print("No spawn points found!")
		#return
#
	#var marker = spawn_points.pick_random()
#
	#var pet = PetScene.instantiate()
	#pet.global_position = marker.global_position
#
	#get_tree().current_scene.add_child(pet)
