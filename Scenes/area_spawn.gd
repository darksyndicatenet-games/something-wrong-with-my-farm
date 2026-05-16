extends Area2D

@export var animal_scene: PackedScene
@export var spawn_interval: float = 1.0
@onready var area_spawn: Area2D = $"."

func _ready():
	await get_tree().process_frame
	spawn_loop()

func spawn_loop():
	while true:
		spawn_animal()
		await get_tree().create_timer(spawn_interval).timeout

func get_random_point() -> Vector2:
	var shape = $CollisionShape2D.shape as RectangleShape2D
	
	if shape == null:
		print("Shape is not RectangleShape2D")
		return global_position
	
	var extents = shape.extents
	
	var spread := 500  # bigger area

	var random_offset = Vector2(
		randf_range(-spread, spread),
		randf_range(-spread, spread)
	)
	
	return $CollisionShape2D.global_position + random_offset
	
	
func spawn_animal():
	if animal_scene == null:
		print("No animal scene")
		return
	
	var animal = animal_scene.instantiate()

	get_tree().current_scene.add_child(animal)

	animal.global_position = get_random_point()
	animal.z_index = 100

	print("Spawned")
	print(get_random_point())
