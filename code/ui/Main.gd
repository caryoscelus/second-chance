extends Container

signal time_passed

export(String, FILE, "*.tscn") var intro_dialogue

var dialogue

func _ready():
	select_tab(0)
	GlobalEventLog.write("main", "job started")
	if intro_dialogue:
		load_dialogue(intro_dialogue)

func load_dialogue(path):
	dialogue = load(path).instance()
	add_child(dialogue)
	dialogue.connect("finished_story", self, "remove_dialogue")

func remove_dialogue():
	remove_child(dialogue)
	dialogue.queue_free()

func select_tab(id):
	# meh, lets assume id == child number
	hide_all()
	get_child(id).set_hidden(false)

func hide_all():
	for child in get_children():
		if not "persistent" in child.get_groups():
			child.set_hidden(true)

func pass_time():
	for zone in ZoneInfos.get_zones():
		zone.pass_time()
	GlobalEventLog.write("main", "month passed")
	emit_signal("time_passed")

func show_hide_log(to_show):
	get_node("EventLog").set_hidden(not to_show)
