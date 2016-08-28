extends Node

export(String) var pc_zone

func get_zone(zone):
	return get_node(zone)

func get_zones():
	return get_children()
