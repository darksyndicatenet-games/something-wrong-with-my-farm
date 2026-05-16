extends Control

@onready var wheat_tracker: Label = $Panel/WheatTracker


func _physics_process(_delta: float) -> void:
	wheat_tracker.text = "Crops: " + str(Globals.wheet_wallet)
