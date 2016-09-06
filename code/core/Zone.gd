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

## Zone: contains zone info

extends "DataContainer.gd"

const DataArray = preload("DataArray.gd")
const People = preload("People.gd")

export(String) var name

var population = {}

func _ready():
	if not has_node("units"):
		set("units", DataArray.new())
	if not has_node("sites"):
		set("sites", DataArray.new())
	if not has_node("pos"):
		set("pos", Position2D.new())