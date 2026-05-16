extends Area2D


@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var grown = false

func _ready():
	await get_tree().process_frame
	grown = false
	anim.play("Wheet")

	# wait 5 seconds then mark as ready
	await get_tree().create_timer(1.0).timeout
	grown = true


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if body.has_method("harvest_crop"):
			body.harvest_crop(self)
			#anim.visible = false

#
#func _on_body_exited(body: Node2D) -> void:
	#pass # Replace with function body.
	
func reset_crop():
	
	grown = false
	anim.play("Wheet")
	#anim.visible = true

	await get_tree().create_timer(5.0).timeout
	grown = true
	
