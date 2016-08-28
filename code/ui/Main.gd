extends Container

signal time_passed

func _ready():
	select_tab(0)
	GlobalEventLog.write("main", "job started")

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
	emit_signal("time_passed")

func show_hide_log(to_show):
	get_node("EventLog").set_hidden(not to_show)
