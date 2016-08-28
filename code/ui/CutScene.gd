extends CenterContainer

signal finished_story

var story
var story_pos = 0

onready var text = get_node("container/text")
onready var picture = get_node("container/picture")
onready var bg = get_node("bg")
onready var old = get_node("old")
onready var animation = get_node("animation")

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

var wait_for_click = false

func advance_story():
	if story == null:
		return
	story_pos += 1
	if story_pos >= story.size():
		emit_signal("finished_story")
		return
	var scene = story[story_pos]
	get_node("timer").set_wait_time(scene.timer)
	
	var viewport = get_node("/root")
	viewport.queue_screen_capture()
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	var image = viewport.get_screen_capture()
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	old.set_texture(texture)
	animation.play("fadeout")
	
	text.set_text(scene.text)
	wait_for_click = scene.wait
	if "picture" in scene:
		load_picture(scene.picture)
	else:
		load_picture(null)
	#if "bg_color" in scene:
		#set_bg_color(scene.bg_color)
	get_node("timer").start()

func load_picture(path):
	if path:
		picture.set_texture(load("res://gfx/illustrations/%s.png"%path))
	else:
		picture.set_texture(null)

func timer_tick():
	if not wait_for_click:
		advance_story()
