extends Node2D

@export var EvilCatScene: PackedScene
@export var BunnyScene: PackedScene
@export var AreaSpawn: Area2D
@export var SpawnTimer: Timer

var rng = RandomNumberGenerator.new()

#@onready var : Marker2D = $Fence
@onready var fence: Marker2D = $"../TargetMarker"


func _ready():
	SpawnTimer.timeout.connect(_on_spawn_timer_timeout)
	

func _on_spawn_timer_timeout():
	# Pick a random marker from the group "spawn_markers"
	print("Pka")
	var markers = get_tree().get_nodes_in_group("spawn_markers")
	if markers.size() == 0:
		print("No markers found in group 'spawn_markers'")
		return

	var random_marker = markers[rng.randi_range(0, markers.size() - 1)]

	# Check if a pet is already at this marker
	for pet in AreaSpawn.get_children():
		if pet.position == random_marker.global_position:
			print("Marker already has a pet, skipping spawn")
			return

	# Pick a random pet to spawn
	var pet_scene = EvilCatScene if rng.randi_range(0, 1) == 0 else BunnyScene

	spawn_pet(pet_scene, random_marker.global_position)

func spawn_pet(pet_scene: PackedScene, position: Vector2):
	var pet_instance = pet_scene.instantiate()
	pet_instance.position = position
	AreaSpawn.add_child(pet_instance)
	
func _on_pet_spawned():
	pass
