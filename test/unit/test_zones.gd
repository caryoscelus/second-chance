extends "../gut/gut.gd".Test

const DataContainer = preload("res://code/core/DataContainer.gd")
const Zone = preload("res://code/core/Zone.gd")
var zones

func setup():
	zones = DataContainer.new()

func teardown():
	zones.queue_free()

func test_create():
	zones.clear()
	var zone = Zone.new()
	assert_ne(zone.units, null)
	assert_true(zone.units extends DataContainer)
	zones.append(zone)
	assert_eq(zones.get(0), zone)

func test_predefined():
	zones.clear()
	var zone = load("res://test/unit/zone.tscn").instance()
	assert_true(zone extends Zone)
	assert_true(zone.units extends DataContainer)
	zones.append(zone)
	assert_eq(zones[zone.get_name()], zone)
