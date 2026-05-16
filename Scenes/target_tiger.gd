extends Marker2D

var sprites = [
	preload("res://Tiger/TigerPhaseTwo/grown_up_tiger1.png"),
	preload("res://Tiger/TigerPhaseThree/ultimate1.png")
]

var index := 0

@export var tiger_scene: PackedScene

var is_spawn_tiger := false
var tiger_instance = null

@onready var target_tiger_point: Marker2D = self


func _physics_process(_delta: float) -> void:

	if Globals.tiger_track >= 1 and not is_spawn_tiger:
		spawn_animal()
		is_spawn_tiger = true
		Globals.tiger_spawned = true

	if Input.is_action_just_pressed("click") and Globals.wheet_wallet > 0 and Globals.tiger_phase < 3:
		cycle_tiger_sprite()
		Globals.wheet_wallet -= 1
		Globals.tiger_phase += 1


func spawn_animal():
	tiger_instance = tiger_scene.instantiate()
	get_tree().current_scene.add_child(tiger_instance)
	tiger_instance.global_position = target_tiger_point.global_position


func cycle_tiger_sprite():
	if tiger_instance == null:
		return

	index = (index + 1) % sprites.size()

	var sprite = tiger_instance.get_node("Sprite2D")
	sprite.texture = sprites[index]
