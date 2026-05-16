extends CharacterBody2D

@onready var choices: Node2D = $Choices
@onready var bunny_sprite: AnimatedSprite2D =$Feed1
#@onready var feed_1: AnimatedSprite2D = $Feed1

var feed_states = ["Feed1", "Feed2", "Feed3", "Failed"]
var current_feed = 0
@onready var sfx: AudioStreamPlayer2D = $SFX



func _ready() -> void:
	choices.visible = false
	bunny_sprite.play(feed_states[current_feed])


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		choices.visible = true
		print("Aye")


func _on_btn_feedme_pressed() -> void:
	print("fed")

	current_feed += 1
	
	if current_feed >= feed_states.size():
		current_feed = 0   # loops back to first animation
	sfx.play()
	bunny_sprite.play(feed_states[current_feed])


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		choices.visible = false
