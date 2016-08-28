extends Panel

signal finished_story

var left_speaker setget set_left
var right_speaker setget set_right

onready var textbox = get_node("textbox")
onready var left_portrait = get_node("left")
onready var right_portrait = get_node("right")

var story
var story_pos

var all_text = ""

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
	if scene.clear:
		clear()
	if "speaker" in scene:
		if scene.lr == 0:
			set_left(scene.speaker)
		else:
			set_right(scene.speaker)
	say(scene.lr, scene.text)

func set_left(speaker):
	left_speaker = speaker
	left_portrait.set_texture(speaker.texture)

func set_right(speaker):
	right_speaker = speaker
	right_portrait.set_texture(speaker.texture)

func say(lr, text):
	var speaker
	if lr == 0:
		speaker = left_speaker
	elif lr == 1:
		speaker = right_speaker
	else:
		# eeh, exception should be raised here
		return
	var name = "nobody"
	if speaker:
		name = speaker.name
	var bb
	if lr == 0:
		bb = name+"\n[b]"+text+"[/b]\n"
	elif lr == 1:
		bb = "[right]"+name+"\n[b]"+text+"[/b][/right]\n"
	all_text += bb
	textbox.parse_bbcode(all_text)

func clear():
	all_text = ""
