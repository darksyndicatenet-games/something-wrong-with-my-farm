extends Marker2D


@export var tiger_scene: PackedScene
#@onready var : Marker2D = $Marker2D
#@onready var spawn_points = $SpawnPoints.get_children()

var is_spawn_tiger : bool = false
@onready var target_tiger_point: Marker2D = $"."

#func _ready() -> void:
	#await get_tree().process_frame
	#spawn_animal()

func _physics_process(_delta: float) -> void:
	if Globals.tiger_track >= 1 and is_spawn_tiger == false:
		spawn_animal()
		is_spawn_tiger = true
		Globals.tiger_spawned = true

func spawn_animal():
	var animal = tiger_scene.instantiate()
	get_tree().current_scene.add_child(animal)
	#var point = tiger_spawn_points[randi() % spawn_points.size()]
	animal.global_position = target_tiger_point.global_position
