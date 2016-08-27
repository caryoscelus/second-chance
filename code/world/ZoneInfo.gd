extends Node

var id = "" setget set_id
var name = ""

func set_id(new_id):
	id = new_id
	if not name:
		name = id

var allies = []

var reputation = {
	gov = 0,
	antiprog = 0,
	locals = 0,
}

var employees = {
	workers = 0,
	engineers = 0,
	scientists = 0,
}

var tech = {
	rocket = 0.0,
	nuclear = 0.0,
	computer = 0.0,
	excavate = 0.0,
}

var resources = {
	money = 0,
	weapons = 0,
	excavators = 0,
}
