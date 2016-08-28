# Unit of employees
extends Node

var type
var workers = []
var engineers = []
var scientists = []
var worker_salary = 0
var engineer_salary = 0
var scientist_salary = 0

class Bunch:
	var egroup
	var amount
	
	func turnover(salary):
		var group = EmployeeGroups.get_group(egroup)
		var quit_percent = randf()/(salary/group.salary_min)
		var hired_percent = randf()*(salary/group.salary_great)
		amount *= hired_percent/quit_percent
		amount = round(amount)

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
	for bunch in workers:
		bunch.turnover(worker_salary)
	for bunch in engineers:
		bunch.turnover(engineer_salary)
	for bunch in scientists:
		bunch.turnover(scientist_salary)

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
