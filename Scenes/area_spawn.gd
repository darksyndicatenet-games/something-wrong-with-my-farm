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
	
	var extents = shape.extents
	
	var random_x = randf_range(-extents.x, extents.x)
	var random_y = randf_range(-extents.y, extents.y)
	
	return global_position + Vector2(random_x, random_y)
	
func spawn_animal():
	if animal_scene == null:
		print("NO ANIMAL SCENE ASSIGNED")
		return
	var animal = animal_scene.instantiate()
	get_tree().current_scene.add_child(animal)
	animal.global_position = get_random_point()
