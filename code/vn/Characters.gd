extends Node

signal pc_changed(pc)

var pc

func get_character(id):
	return get_node(id)

func set_pc(new_pc):
	pc = new_pc
	emit_signal("pc_changed", pc)

func get_pc():
	return get_character(pc)
