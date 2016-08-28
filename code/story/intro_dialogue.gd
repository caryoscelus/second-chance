extends "res://code/vn/dialogue.gd"

onready var leader = Characters.get_character("leader")

func _ready():
	scene(0, "So you are saying..", leader)
	get_parent().load_story(story)
