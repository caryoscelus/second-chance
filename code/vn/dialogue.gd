extends Node

var story = []

func choice(text, choices):
	story.append({text=text, choices=choices})

func scene(lr, text, speaker=null, clear=false):
	var new_scene = { lr=lr, text=text, clear=clear }
	if speaker:
		new_scene.speaker = speaker
	story.append(new_scene)
