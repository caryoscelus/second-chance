extends Container

signal time_passed

export(String, FILE, "*.tscn") var intro_dialogue

onready var pc_portrait_container = get_node("pc_portrait")
onready var pc_portrait = get_node("pc_portrait/portrait")
onready var aircraft_player = get_node("WorldMap/aircraft/player")

var dialogue
var is_intro_dialogue = true

func _ready():
	Characters.connect("pc_changed", self, "update_pc_portrait")
	select_tab(0)
	GlobalEventLog.write("main", "job started")
	if intro_dialogue:
		load_dialogue(intro_dialogue)

func update_pc_portrait(pc):
	pc_portrait_container.set_hidden(false)
	pc_portrait.set_texture(load(Characters.get_pc().portrait))

func load_dialogue(path):
	dialogue = load(path).instance()
	add_child(dialogue)
	dialogue.connect("finished_story", self, "end_of_dialogue")

func end_of_dialogue(results):
	# meh
	if is_intro_dialogue:
		is_intro_dialogue = false
		aircraft_player.play("go_europa")
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
