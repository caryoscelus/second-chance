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

## Unit: a working unit of people who do their jobs

extends Node

var population = {}
var salary = {}
var task

func get_amount(profession):
	var total = 0
	for people_kind in population:
		var people = SCWorld.people[people_kind]
		if people.profession == profession:
			total += population[people_kind]
	return total

func get_power(profession):
	var total = 0.0
	for people_kind in population:
		var people = SCWorld.people[people_kind]
		if people.profession == profession:
			total += population[people_kind] * people.skill
	return total

func process(dt):
	pass
