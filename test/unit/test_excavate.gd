# test excavation

extends "../gut/gut.gd".Test

const ExcavateUnit = preload("res://code/core/ExcavateUnit.gd")
const People = preload("res://code/core/People.gd")
const ExcavateSite = preload("res://code/core/ExcavateSite.gd")

func test_dig_gold():
	var workers_1 = People.new()
	workers_1.profession = "worker"
	workers_1.skill = 1.0
	SCWorld.people.set("workers_1", workers_1)
	var site = ExcavateSite.new()
	site._ready()
	site.amount = {gold=1024}
	site.density = {gold=0.5}
	
	digged_gold = false
	digged_gold_amount = 0.0
	do_test_dig_gold(site)

var digged_gold = false
var digged_gold_amount = 0.0

func do_test_dig_gold(site):
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
	digged_gold_amount += amount
	digged_gold = true
	assert_eq(amount, 1.0*16*1.0)

const PredefinedZone = preload("zone_2.tscn")

func test_predefined_zone():
	var zone = PredefinedZone.instance()
	var site = zone.sites.site_a
	site._ready()
	do_test_dig_gold(site)
