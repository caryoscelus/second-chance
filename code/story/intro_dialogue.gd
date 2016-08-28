extends "res://code/vn/dialogue.gd"

onready var leader = Characters.get_character("leader")

func _ready():
	scene(0, "So you are saying..", leader)
	choice("Who will be your manager?", [
		{
			text = "Aalto",
			image = "res://gfx/portraits/aalto.png",
			result = "aalto",
		},
		{
			text = "Sasha",
			image = "res://gfx/portraits/sasha.png",
			result = "sasha",
		}
	])
	get_parent().load_story(story)
