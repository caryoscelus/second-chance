extends "../gut/gut.gd".Test

const DataContainer = preload("res://code/core/DataContainer.gd")
const DataArray = preload("res://code/core/DataArray.gd")
const Zone = preload("res://code/core/Zone.gd")
var zones

func setup():
	zones = DataArray.new()

func teardown():
	zones.queue_free()

func test_create():
	zones.clear()
	var zone = Zone.new()
	zone._ready()
	assert_ne(zone.units, null)
	assert_true(zone.units extends DataArray)
	assert_eq(zone.get_node("units"), zone.units)
	zones.append(zone)
	#assert_eq(zones.get(0), zone)

func test_predefined():
	zones.clear()
	var zone = load("res://test/unit/zone.tscn").instance()
	assert_true(zone extends Zone)
	assert_true(zone.units extends DataArray)
	zones.append(zone)
	assert_eq(zones[zone.get_name()], zone)
