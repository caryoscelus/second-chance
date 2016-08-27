# Zones singleton
extends Node

var Zone = preload("Zone.gd")
var zones = []

func _ready():
	new_zone(0, "europe")
	new_zone(1, "northen africa")

func new_zone(id, name):
	var zone = Zone.new()
	zone.id = id
	zone.name = name
	zones.append(zone)
