extends Node2D

@export var pens: Array[GamePen] = [$Pen_One, $Pen_Two, $Pen_Three]

func try_to_place_item(new_item: Node2D) -> void:
	var placed_successfully: bool = false
	for pen in pens:
		# Check if the current pen is empty
		if not pen.is_occupied():
			# Found one! Place the item and exit the loop immediately
			pen.occupy_pen(new_item)
			placed_successfully = true
			break 
			
	# If we ran through the entire loop and never marked 'placed_successfully' as true
	if not placed_successfully:
		print("All pens are full!")
		# Here you can also trigger a HUD message to show "All pens are full" to the player.
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
