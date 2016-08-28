extends Panel

signal finished_story(result)

var left_speaker setget set_left
var right_speaker setget set_right

onready var textbox = get_node("textbox")
onready var left_portrait = get_node("left")
onready var right_portrait = get_node("right")
onready var choice_popup = get_node("choice_container/choice")

var story
var story_pos

var choice_options
var choice_results = []
var popup_finished = true

var all_text = ""

func _ready():
	set_process_input(true)
	if story != null:
		advance_story()

func _input(event):
	if not popup_finished:
		return
	if event.is_action_pressed("advance_story"):
		get_tree().set_input_as_handled()
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
	if "choices" in scene:
		choice(scene.text, scene.choices[0], scene.choices[1])
		return
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

func choice(text, option_a, option_b):
	choice_options = [option_a.result, option_b.result]
	choice_popup.get_node("container/label").set_text(text)
	var a = choice_popup.get_node("container/a")
	var b = choice_popup.get_node("container/b")
	
	a.set_text(option_a.text)
	if "image" in option_a:
		a.set_button_icon(load(option_a.image))
	else:
		a.set_button_icon(null)
	
	b.set_text(option_b.text)
	if "image" in option_b:
		b.set_button_icon(load(option_b.image))
	else:
		b.set_button_icon(null)
	
	popup_finished = false
	
	choice_popup.call_deferred("popup_centered")

func made_choice(i):
	popup_finished = true
	choice_results.append(choice_options[i])
	choice_popup.set_hidden(true)

func _on_choice_popup_hidden():
	if not popup_finished:
		choice_popup.call_deferred("popup_centered")

func clear():
	all_text = ""
