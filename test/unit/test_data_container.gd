extends "../gut/gut.gd".Test

const DataContainer = preload("res://code/core/DataContainer.gd")
const DataArray = preload("res://code/core/DataArray.gd")

func test_array():
	var container = DataArray.new()
	assert_eq(container.size(), 0)
	var node = Node.new()
	node.set_name("a")
	container.append(node)
	assert_eq(container.size(), 1)
	#assert_eq(container[0], node)
	#assert_eq(container.get(0), node)
	assert_true("a" in container)
	assert_eq(container.a, node)
	container.remove(node)
	assert_eq(container.size(), 0)
	#assert_false("a" in container)
	#assert_eq(container.a, null)

func test_set():
	var container = DataContainer.new()
	var node = Node.new()
	#container["abc"] = node
	#container.abc = node
	container.set("abc", node)
	assert_eq(container.abc, node)
	assert_eq(node.get_name(), "abc")

func test_predefined():
	var container = load("res://test/unit/container.tscn").instance()
	assert_eq(container.size(), 3)
	assert_eq(typeof(container.a), TYPE_OBJECT)
	assert_true(container.a extends Node)
	container.remove(container.b)
	assert_eq(container.size(), 2)
	#assert_eq(container.get(1), container.c)
