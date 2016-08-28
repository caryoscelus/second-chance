extends "Unit.gd"

const Resources = preload("Resources.gd")

func _init():
	type = "research"

func work():
	var resources = Resources.new()
	return resources
