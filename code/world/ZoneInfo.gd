extends Node

const Resources = preload("../core/Resources.gd")

export(String) var id
export(String) var name

var allies = []

var reputation = {
	gov = 0,
	antiprog = 0,
	locals = 0,
}

var workers = 0
var engineers = 0
var scientists = 0

var resources = Resources.new()

var units = []

func pass_time():
	for unit in units:
		add_resources(unit.pass_time())

func add_resources(res):
	for r in ["gold", "rocket"]:
		resources[r] += res[r]
