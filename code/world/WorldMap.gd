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

signal zone_clicked(zone)
signal site_clicked(site)

var world = SCWorld

onready var zones = get_node("zones")

func _ready():
	spawn_zones()

func spawn_zones():
	for zone in world.zones.get_all():
		var zone_node = TextureButton.new()
		var gfx_path = "res://gfx/world/zone-%s"%zone.get_name()
		var mask = load(gfx_path+".pbm")
		var label
		if mask != null:
			var texture = load(gfx_path+".png")
			zone_node.set_click_mask(mask)
			zone_node.set_hover_texture(texture)
			zone_node.connect("button_down", self, "emit_signal", ["zone_clicked", zone])
			label = Label.new()
		else:
			label = Button.new()
			label.connect("button_down", self, "emit_signal", ["zone_clicked", zone])
		var pos = zone.pos.get_pos()
		label.set_pos(pos)
		label.set_text(zone.get_name())
		zone_node.add_child(label)
		spawn_sites(zone, zone_node)
		zones.add_child(zone_node)

func spawn_sites(zone, node):
	for site in zone.sites.get_all():
		var site_node = Button.new()
		site_node.set_text(site.get_name())
		site_node.set_pos(site.pos.get_pos())
		site_node.connect("button_down", self, "emit_signal", ["site_clicked", site])
		node.add_child(site_node)

const LesserEventPopup = preload("res://scenes/world/LesserEventPopup.tscn")

func click_site_test(site):
	var popup = LesserEventPopup.instance()
	popup.set_pos(site.pos.get_pos())
	self.add_child(popup)

const ZoneInfo = preload("res://scenes/ui/ZoneInfo.tscn")

onready var zone_infos = get_node("zone_infos")

func show_zone_info(zone):
	var old_info = zone_infos.get_node(zone.name)
	if old_info != null:
		old_info.queue_free()
		return
	var info = ZoneInfo.instance()
	info.set_zone(zone)
	info.set_pos(zone.pos.get_pos())
	zone_infos.add_child(info)
