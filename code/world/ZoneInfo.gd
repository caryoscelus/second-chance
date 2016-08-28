extends Node

const Resources = preload("../core/Resources.gd")

export(String) var id
export(String) var name

var allies = []

var reputation = {
	gov = 0,
	antiprog = 0,
	locals = 0,
}

var workers = 0
var engineers = 0
var scientists = 0

var resources = Resources.new()

var units = []
