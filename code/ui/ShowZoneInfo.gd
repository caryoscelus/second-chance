extends Panel

onready var headers = get_node("headers")
onready var container = get_node("container")

func _ready():
	select_tab(0)

func select_tab(tab):
	var res_name = container.get_node("tabs").get_button_text(tab) #meh
	for child in container.get_children():
		if not "persistent" in child.get_groups():
			container.remove_child(child)
	var header = headers.get_node(res_name).duplicate()
	header.set_hidden(false)
	container.add_child(header)
	for zone in ZoneInfos.get_zones():
		var name = zone.name
		var line = header.duplicate()
		var skip = true # meh
		for cell in line.get_children():
			if skip:
				cell.set_text(name)
				skip = false
				continue
			#cell.set_text(str(zone[res_name][cell.get_name()]))
		container.add_child(line)
