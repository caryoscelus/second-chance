extends "res://code/vn/dialogue.gd"

onready var leader = Characters.get_character("leader")
onready var luca = Characters.get_character("luca")

func _ready():
	scene(0, "..So you are saying..", leader)
	scene(1, "Yes, we must restore nuclear technology to survive this.", luca)
	scene(1, "This is the only way we will be able to gather enough energy to send message which will be heard.")
	scene(1, "To put it simple, we'll have to detonate several specially-prepared powerful nuclear missiles in space.", luca, true)
	scene(0, "And how will such acts of destruction will help us send that message?")
	scene(1, "Well, they will be carefully designed so that the light will fluctuate in predefined order.")
	scene(1, "It will be like our radio, but using binary code and on a larger scale.", luca, true)
	scene(0, "Binary codes? Does that mean we'll also have to ressurect computer technology?!")
	scene(1, "I'm afraid so.")
	scene(1, "Even if we would use analogue signal coding, we still won't be able to control missiles without computers.", luca, true)
	scene(0, "Well..")
	scene(0, "We all may regret it later, but i'm gonna trust you on this.")
	scene(0, "Should i put you in charge of this operation?")
	scene(1, "I would humbly ask you to not do so, Leader.", luca, true)
	scene(1, "I'm not skilled at managing people.")
	scene(0, "Very well. I understand that.")
	scene(0, "But it should be someone who understands the problem, someone from Science Commitee.")
	scene(0, "Who would you recommend?", leader, true)
	scene(1, "I've prepared two candidates. Both of them are skilled in science and proved to be good managers.")
	scene(1, "Even if on a much smaller scale.")
	choice("Who will lead this project?", [
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
	scene(1, "Very well, then.", luca, true)
	get_parent().load_story(story)
