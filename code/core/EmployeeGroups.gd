extends Node

func get_group(egroup):
	return get_child(egroup)

func get_groups():
	var groups = []
	for group in get_children():
		if group.active:
			groups.append(group)
	return groups
