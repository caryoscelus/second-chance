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

## World Map

extends TextureFrame

onready var zones = get_node("zones")

func _ready():
	var world = SCWorld
	# for test
	world.zones.append(load("res://scenes/data/zones/Europa.tscn").instance())
	for zone in world.zones.get_all():
		var zone_node = TextureButton.new()
		var gfx_path = "res://gfx/world/zone-%s"%zone.get_name()
		var mask = load(gfx_path+".pbm")
		if mask != null:
			var texture = load(gfx_path+".png")
			zone_node.set_click_mask(mask)
			zone_node.set_hover_texture(texture)
		var pos = zone.pos.get_pos()
		logger.warn(str(pos))
		var button = Button.new()
		button.set_pos(pos)
		button.set_text(zone.get_name())
		zone_node.add_child(button)
		zones.add_child(zone_node)
