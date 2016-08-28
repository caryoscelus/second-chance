extends "res://code/vn/dialogue.gd"

onready var pc = Characters.get_pc()
onready var akira = Characters.get_character("akira")

func _ready():
	scene(1, "Welcome to Europa, %s!"%[pc.name], akira)
	scene(1, "Let me introduce myself.")
	scene(1, "I am Akira and i will be your counsellor.")
	scene(0, "Ok.", pc)
	scene(1, "If you don't mind, i'll guide you through your duties.", akira, true)
	choice("", [{text="Yes, please.", result=true}, {text="No, thanks.", result=false}])
	scene(1, "As you wish, commander.")
	get_parent().load_story(story)
	get_parent().connect("finished_story", self, "end_of_story")

func end_of_story(results):
	Counsellor.active = results[0]
	if Counsellor.active:
		Counsellor.emit_signal("guide_tour")
