extends MarginContainer

# This grabs a reference to your text label using its unique name

@onready var rich_text_label: RichTextLabel = $PanelContainer/RichTextLabel

## This is a public method other nodes can call to update the text

func update_display(meat: int, animals: int, coins: int, wheat: int) -> void:
	var output = "[b]CURRENT RESOURCES:\n[/b]"
	
	output += "[font_size=12]"
	
	output += "[table=2]"
	
	output += "[cell]Current WHEAT: [/cell]"
	output += "[cell]%d[/cell]" % wheat
	
	output += "[cell]Current ANIMALS in pen:  [/cell]"
	output += "[cell]%d[/cell]" % animals
	
	output += "[cell]Current COINS:  [/cell]"
	output += "[cell]%d[/cell]" % coins
	
	output += "[cell]Current ANIMAL MEAT:  [/cell]"
	output += "[cell]%d[/cell]" % meat
	
	output += "[/table]"
	output += "[/font_size]"
	
	# Assign it all to the label
	rich_text_label.text = output
