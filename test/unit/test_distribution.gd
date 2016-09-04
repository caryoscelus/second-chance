## Test non-random Distribution

extends "../gut/gut.gd".Test

const Distribution = preload("res://code/core/Distribution.gd")

func test_distribution():
	var d = Distribution.new()
	assert_eq(d.from_density(0.5, 2.0), 1.0)
	assert_eq(d.from_density(1.0, 3.0), 3.0)
