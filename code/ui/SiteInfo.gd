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

## Site info widget
## TODO: merge with ZoneInfo?

extends PanelContainer

var is_ready = false
var site

func _ready():
	is_ready = true
	update()

func set_site(new_site):
	site = new_site
	update()

onready var name = get_node("box/name")
onready var type = get_node("box/type")
onready var units = get_node("box/units")

func update():
	if not is_ready:
		return
	clear()
	if site == null:
		return
	name.set_text(site.get_name())
	type.set_text(site.type)
	update_units()

func clear():
	name.set_text("")
	type.set_text("")
	units.clear()

func update_units():
	for unit in site.units.get_all():
		units.add_button(unit.get_name())
