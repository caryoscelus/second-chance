# test unit

extends "../gut/gut.gd".Test

const Unit = preload("res://code/core/Unit.gd")
const People = preload("res://code/core/People.gd")

func setup():
	var a0 = People.new()
	a0.profession = "a"
	a0.amount = 100
	a0.skill = 2.0
	SCWorld.people.set('a0', a0)
	
	var a1 = People.new()
	a1.profession = "a"
	a1.amount = 50
	a1.skill = 1.0
	SCWorld.people.set('a1', a1)
	
	var b = People.new()
	b.profession = "b"
	b.amount = 10
	b.skill = 0.5
	SCWorld.people.set('b', b)

func test_amount():
	var unit = Unit.new()
	unit.population = {
		'a0' : 100,
		'a1' : 50,
		'b' : 10
	}
	assert_eq(unit.get_amount('a'), 150)
	assert_eq(unit.get_amount('b'), 10)
	assert_eq(unit.get_power('a'), 250.0)
	assert_eq(unit.get_power('b'), 5.0)
