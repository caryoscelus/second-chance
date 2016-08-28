extends Node

var story = []

func _ready():
	scene("<Second Chance>")
	get_parent().load_story(story)

func scene(text, picture=null, bg_color=null):
	var new_scene = {text=text}
	if picture:
		new_scene.picture = picture
	if bg_color:
		new_scene.bg_color = bg_color
	story.append(new_scene)
