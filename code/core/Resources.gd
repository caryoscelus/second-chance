extends Node

const RESOURCE_LIST = [
	"gold",
	"rocket",
	"nuclear",
	"computer",
]

func get_empty():
	var e = {}
	for res in RESOURCE_LIST:
		e[res] = 0
	return e
