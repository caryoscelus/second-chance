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

## Site - excavation site

extends "DataContainer.gd"

const DataContainer = preload("DataContainer.gd")
const DataArray = preload("DataArray.gd")

signal digged(what, amount)

var amount = {}
var density = {}

func _init():
	set("units", DataArray.new())

func apply_work(work):
	"""Somebody worked on digging stuff.
	
	`work` is a dictionary of amount of work distributed among digging resources
	work spent on resources that are not here is wasted
	"""
	var result = {}
	for resource in amount:
		var could_dig = World.distribution.from_density(work[resource], density[resource])
		var digged = max(min(could_dig, amount[resource]), 0)
		amount[resource] -= digged
		if digged > 0:
			result[resource] = digged
		if amount[resource] <= 0:
			amount.remove(resource)
			density.remove(resource)
	notify_digged(result)
	return result

func notify_digged(resources):
	for resource in resources:
		emit_signal("digged", resource, resources[resource])
