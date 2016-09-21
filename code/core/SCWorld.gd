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

## Main World class

extends "DataContainer.gd"

signal time_tick(dt)

const DataArray = preload("DataArray.gd")
const Distribution = preload("Distribution.gd")

var active = true
var time_scale = 1.0
var time = 0.0

const DIGGABLE_RESOURCES = [
	"gold",
	"computer",
	"rocket",
	"nuclear",
]
const RESOURCES = [
	"money",
] + DIGGABLE_RESOURCES

func empty_resources():
	var e = {}
	for res in RESOURCES:
		e[res] = 0.0
	return e

func _init():
	set("zones", DataArray.new())
	set("people", DataArray.new())
	set("distribution", Distribution.new())
	set_process(true)

func _process(dt):
	if active:
		var dts = dt*time_scale
		time += dts
		emit_signal("time_tick", dts)
		for zone in self.zones.get_all():
			zone.process(dts)
