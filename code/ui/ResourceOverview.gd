extends HBoxContainer

onready var resources = get_node("resources")
onready var units = get_node("units")
onready var groups = get_node("groups")

var zone

func _ready():
	set_zone(ZoneInfos.pc_zone)

func set_zone(new_zone):
	zone = ZoneInfos.get_zone(new_zone)
	update_resources()
	update_units()
	update_groups()

func update_resources():
	clear_children(resources)
	
	var template = resources.get_node("template")
	template.set_hidden(true)
	
	# TODO
	for resource in ["gold", "rocket"]:
		var line = template.duplicate()
		line.set_text(line.get_text()%[resource, zone.resources[resource]])
		line.set_hidden(false)
		resources.add_child(line)

func update_units():
	clear_children(units)
	
	var template = units.get_node("template")
	template.set_hidden(true)
	
	for unit in zone.units:
		var line = template.duplicate()
		line.set_text(line.get_text()%[
			unit.type,
			unit.worker_amount(),
			unit.engineer_amount(),
			unit.scientist_amount(),
		])
		line.connect("pressed", self, "edit_unit", [unit])
		units.add_child(line)

func new_unit_popup():
	print("create new unit")

func edit_unit(unit):
	print("edit unit")

func update_groups():
	clear_children(groups)
	var template = groups.get_node("template")
	template.set_hidden(true)
	
	for group in EmployeeGroups.get_groups():
		var line = template.duplicate()
		line.set_text(line.get_text()%[group.name, group.amount, group.type])
		line.set_hidden(false)
		groups.add_child(line)

func clear_children(node):
	for child in node.get_children():
		if not "persistent" in child.get_groups():
			node.remove_child(child)
