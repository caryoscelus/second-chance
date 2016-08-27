extends Panel

const Speaker = preload("../vn/Speaker.gd")

var left_speaker setget set_left
var right_speaker setget set_right

onready var textbox = get_node("textbox")
onready var left_portrait = get_node("left")
onready var right_portrait = get_node("right")

var all_text = ""

func _ready():
	pass

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
