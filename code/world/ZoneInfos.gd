extends Node

var zones = {}

const ZoneInfo = preload("ZoneInfo.gd")

func _ready():
	new_zone("gov")
	new_zone("europe")

func new_zone(id):
	var zone = ZoneInfo.new()
	zone.id = id
	zones[id] = zone
