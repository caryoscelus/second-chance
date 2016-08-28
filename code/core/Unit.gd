# Unit of employees
extends Node

var type
var workers = []
var engineers = []
var scientists = []
var worker_salary = 0
var engineer_salary = 0
var scientist_salary = 0

var is_logged = false

class Bunch:
	var egroup
	var amount
	
	func turnover(salary):
		var group = EmployeeGroups.get_group(egroup)
		var quit = min(round(amount*randf()/(salary/group.salary_min)), amount)
		var hired = round(amount*randf()*(salary/group.salary_great))
		amount += hired-quit
		return [quit, hired]

func new_bunch(egroup, amount):
	var bunch = Bunch.new()
	bunch.egroup = egroup
	bunch.amount = amount
	return bunch

func employ_workers(egroup, amount):
	workers.append(new_bunch(egroup, amount))

func employ_engineers(egroup, amount):
	engineers.append(new_bunch(egroup, amount))

func employ_scientists(egroup, amount):
	scientists.append(new_bunch(egroup, amount))

func worker_amount():
	return get_amount(workers)

func engineer_amount():
	return get_amount(engineers)

func scientist_amount():
	return get_amount(scientists)

func work():
	"""Do your job, slaves! -- implemented in subclasses"""
	pass

func turnover():
	"""Slaves might like or might not like to be slaves"""
	for type in ["worker", "engineer", "scientist"]:
		for bunch in get(type+"s"):
			var turnover = bunch.turnover(get(type+"_salary"))
			var quit = turnover[0]
			var hired = turnover[1]
			write_log("%s %ss quit and %s were hired"%[quit, type, hired])

func pass_time():
	var results = work()
	turnover()
	return results

func get_amount(employees):
	var total = 0
	for bunch in employees:
		total += bunch.amount
	return total

func get_power(employees):
	var total = 0
	for bunch in employees:
		var group = EmployeeGroups.get_group(bunch.egroup)
		total += bunch.amount * group.skill
	return total

func get_salary():
	return worker_amount()*worker_salary + engineer_amount()*engineer_salary + scientist_amount()*scientist_salary

func write_log(msg):
	if is_logged:
		GlobalEventLog.write("main", "[b]%s unit: [/b]%s"%[type, msg])
