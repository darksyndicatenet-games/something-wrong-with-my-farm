extends Marker2D
@export var bunny_scene: PackedScene
#@onready var : Marker2D = $Marker2D
#@onready var spawn_points = $SpawnPoints.get_children()
@onready var spawn_point: Marker2D = $"."
var is_spawn_bunnny : bool = false

#func _ready() -> void:
	#await get_tree().process_frame
	#spawn_animal()

func _physics_process(_delta: float) -> void:
	if Globals.bunny_track >= 1 and is_spawn_bunnny == false:
		spawn_animal()
		is_spawn_bunnny = true
		Globals.bunny_spawned = true

func spawn_animal():
	var animal = bunny_scene.instantiate()
	get_tree().current_scene.add_child(animal)
	#var point = spawn_points[randi() % spawn_points.size()]
	animal.global_position = spawn_point.global_position
