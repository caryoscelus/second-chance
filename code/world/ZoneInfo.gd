extends Node

const Resources = preload("../core/Resources.gd")

# TODO: depend on reputation
var max_credit = 10000

export(String) var id
export(String) var name
export(bool) var is_logged = false

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
		spend_money(unit.get_salary(), "paid salary of %s unit" % unit.type)
		add_resources(unit.pass_time())
	check_budget()

func add_resources(res):
	for r in ["gold", "rocket"]:
		resources[r] += res[r]

func spend_money(amount, reason="spent"):
	resources.gold -= amount
	write_log("[b]%s[/b]: %s gold"%[reason, amount])

func check_budget():
	if resources.gold < -max_credit:
		write_log("GAME OVER - spent all money")

func write_log(msg):
	if is_logged:
		GlobalEventLog.write("main", msg)
