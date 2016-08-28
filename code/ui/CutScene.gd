extends CenterContainer

signal finished_story

var story
var story_pos = 0

onready var text = get_node("container/text")
onready var picture = get_node("container/picture")
onready var bg = get_node("bg")

func _ready():
	set_process_input(true)
	if story != null:
		advance_story()

func _input(event):
	if event.is_pressed():
		advance_story()

func load_story(new_story):
	story = new_story
	story_pos = -1

func advance_story():
	if story == null:
		return
	story_pos += 1
	if story_pos >= story.size():
		emit_signal("finished_story")
		return
	var scene = story[story_pos]
	text.set_text(scene.text)
	if "picture" in scene:
		load_picture(scene.picture)
	#if "bg_color" in scene:
		#set_bg_color(scene.bg_color)

func load_picture(path):
	picture.set_texture(load(path))