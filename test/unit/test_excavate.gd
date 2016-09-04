# test excavation

extends "../gut/gut.gd".Test

const ExcavateUnit = preload("res://code/core/ExcavateUnit.gd")
const People = preload("res://code/core/People.gd")
const Site = preload("res://code/core/Site.gd")

var site

func setup():
	var workers_1 = People.new()
	workers_1.profession = "worker"
	workers_1.skill = 1.0
	SCWorld.people.set("workers_1", workers_1)
	site = Site.new()
	site.amount = {gold=1024}
	site.density = {gold=0.5}

var digged_gold = false
var digged_gold_amount

func test_dig_gold():
	var unit = ExcavateUnit.new()
	unit.population = {
		"workers_1" : 16
	}
	site.units.append(unit)
	site.connect("digged", self, "has_digged_gold")
	unit.process(1.0)
# 	while not digged_gold:
# 		yield(SCWorld.get_tree(), "idle_frame")
# 	assert_eq(digged_gold_amount, 1.0*16*1.0)

func has_digged_gold(what, amount):
	assert_eq(what, "gold")
	digged_gold_amount = amount
	digged_gold = true
	assert_eq(amount, 1.0*16*1.0)
