extends CharacterBody2D

@onready var choices: Node2D = $Choices
@onready var tiger_Sprite: AnimatedSprite2D = $AnimatedSprite2D
#@onready var tiger_Sprite: CharacterBody2D = $"."

var feed_states = ["feed1", "feed2", "feed3"]
var current_feed = 0


func _ready() -> void:
	choices.visible = false
	tiger_Sprite.play(feed_states[current_feed])


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		choices.visible = true
		print("Aye")


func _on_btn_feedme_pressed() -> void:
	print("fed")

	current_feed += 1
	
	if current_feed >= feed_states.size():
		current_feed = 0   # loops back to first animation

	tiger_Sprite.play(feed_states[current_feed])
