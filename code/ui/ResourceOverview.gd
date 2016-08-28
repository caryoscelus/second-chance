extends HBoxContainer

const ExcavateUnit = preload("res://code/core/ExcavateUnit.gd")
const ResearchUnit = preload("res://code/core/ResearchUnit.gd")

onready var resources = get_node("resources")
onready var units = get_node("units")
onready var unit_editor = get_node("unit_editor")
onready var groups = get_node("groups")

var zone

var editing_unit

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
		line.remove_from_group("persistent")
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
		line.remove_from_group("persistent")
		line.connect("pressed", self, "edit_unit", [unit])
		line.set_hidden(false)
		units.add_child(line)

func create_new_unit(type):
	var unit
	if type == "excavate":
		unit = ExcavateUnit.new()
	elif type == "research":
		unit = ResearchUnit.new()
	zone.units.append(unit)
	edit_unit(unit)

func back_to_unit_list():
	unit_editor.set_hidden(true)
	units.set_hidden(false)
	update_units()

func remove_unit():
	zone.units.erase(editing_unit)
	back_to_unit_list()

func edit_unit(unit):
	units.set_hidden(true)
	editing_unit = unit
	unit_editor.set_hidden(false)

func update_groups():
	clear_children(groups)
	var template = groups.get_node("template")
	template.set_hidden(true)
	
	for group in EmployeeGroups.get_groups():
		var line = template.duplicate()
		line.set_text(line.get_text()%[group.name, group.amount, group.type])
		line.remove_from_group("persistent")
		line.set_hidden(false)
		groups.add_child(line)

func clear_children(node):
	for child in node.get_children():
		if not "persistent" in child.get_groups():
			node.remove_child(child)
