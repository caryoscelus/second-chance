extends HBoxContainer

const Unit = preload("res://code/core/Unit.gd")
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
	update_all()

func update_all():
	update_resources()
	update_units()
	update_unit_editor()
	update_groups()

func update_resources():
	clear_children(resources)
	
	var template = resources.get_node("template")
	template.set_hidden(true)
	
	for resource in Resources.RESOURCE_LIST:
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
	zone.add_unit(unit)
	update_units()
	edit_unit(unit)

func remove_unit():
	zone.remove_unit(editing_unit)
	editing_unit = null
	update_units()
	update_unit_editor()

func edit_unit(unit):
	editing_unit = unit
	update_unit_editor()

func update_unit_editor():
	var bunches = unit_editor.get_node("content/bunches")
	var remove = unit_editor.get_node("content/remove")
	var salary = unit_editor.get_node("salary")
	var type = unit_editor.get_node("type")
	
	bunches.clear()
	remove.clear()
	
	if not editing_unit:
		type.set_text("SELECT UNIT TO EDIT")
		return
	
	type.set_text(editing_unit.type)
	
	var all_bunches = editing_unit.workers + editing_unit.engineers + editing_unit.scientists
	
	for bunch in all_bunches:
		var group = EmployeeGroups.get_group(bunch.egroup)
		bunches.add_button("%ss from %s: %s"%[group.type, group.name, bunch.amount])
		remove.add_button("X")
	
	for type in ["worker", "engineer", "scientist"]:
		salary.get_node(type+"s").set_text(str(editing_unit[type+"_salary"]))

func remove_unit_bunch(n):
	# meh
	for type in ["worker", "engineer", "scientist"]:
		var bunches = editing_unit[type+"s"]
		if n >= bunches.size():
			n -= bunches.size()
		else:
			bunches.remove(n)
			break
	update_unit_editor()

func add_unit_bunch(group):
	if not editing_unit:
		return
	var bunch = Unit.new_bunch(group.id, 10)
	editing_unit[group.type+"s"].append(bunch)
	update_units()
	update_unit_editor()

func change_salary(text, who):
	var salary = text.to_int()
	if salary:
		editing_unit[who+"_salary"] = salary
		update_units()
	else:
		update_unit_editor()

func update_groups():
	clear_children(groups)
	var template = groups.get_node("template")
	template.set_hidden(true)
	
	for group in EmployeeGroups.get_groups():
		var line = template.duplicate()
		line.set_text(line.get_text()%[group.name, group.amount, group.type])
		line.remove_from_group("persistent")
		line.set_hidden(false)
		line.connect("pressed", self, "add_unit_bunch", [group])
		groups.add_child(line)

func clear_children(node):
	for child in node.get_children():
		if not "persistent" in child.get_groups():
			node.remove_child(child)
