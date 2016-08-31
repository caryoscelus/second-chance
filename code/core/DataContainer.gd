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

## DataContainer: Node that lets you access its children like properties

extends Node

func _get(name):
	if typeof(name) == TYPE_STRING:
		return get_node(name)
	# this doesn't really work now
	elif typeof(name) == TYPE_INT:
		return get(name)
	else:
		return null

func get(index):
	return get_child(index)

func _set(name, value):
	print("_set ", name)
	if typeof(value) == TYPE_OBJECT:
		print("it's object")
		value.set_name(name)
		add_child(value)
		print(_get(name) == value)
	else:
		print("it's not!")
		Node._set(self, name, value)
	print("_set end")

func _get_property_list():
	var props = []
	for element in get_all():
		props.append({
			name=element.get_name(),
			type=TYPE_OBJECT,
		})
	return props

func append(element):
	add_child(element)

func remove(element):
	remove_child(element)

func get_all():
	return get_children()

func clear():
	var all = get_all()
	for element in all:
		remove(element)

func size():
	return get_child_count()
