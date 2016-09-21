##
##  Copyright (C) 2016 caryoscelus
##
##  This file is part of second-chance game
##  https://github.com/caryoscelus/second-chance
##  
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##  
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##  
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

## Zone info widget

extends PanelContainer

onready var name = get_node("box/name")
onready var resources = get_node("box/resources")
onready var population = get_node("box/population")

var zone

func _ready():
	update()

func update():
	clear()
	if zone == null:
		return
	name.set_text(str(zone.name))
	update_resources()
	update_population()

func clear():
	var box = get_node("box")
	for node in [
			"resources/names", "resources/values",
			"population/names", "population/values",
		]:
		clear_children(box.get_node(node))

func clear_children(node):
	for child in node.get_children():
		node.remove_child(child)

func update_resources():
	var names = resources.get_node("names")
	var values = resources.get_node("values")
	for res in SCWorld.RESOURCES:
		var name = Label.new()
		var value = Label.new()
		name.set_text(res)
		value.set_text(str(zone.resources[res]))
		names.add_child(name)
		values.add_child(value)

func update_population():
	# TODO
	var names = population.get_node("names")
	var values = population.get_node("values")
