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

## Time control widget

extends PanelContainer

onready var time = get_node("container/time")
onready var play = get_node("container/container/play")
onready var speed = get_node("container/container/speed")

export var speed_change_step = 2.0

func _ready():
	SCWorld.connect("time_tick", self, "time_ticked")
	play.set_pressed(SCWorld.active)
	change_speed(1.0)

func time_ticked(dt):
	time.set_text(str(SCWorld.time))

func toggle_play(play):
	SCWorld.active = play

func slower_speed():
	change_speed(1.0/speed_change_step)

func faster_speed():
	change_speed(speed_change_step)

func change_speed(step):
	SCWorld.time_scale *= step
	speed.set_text(str(SCWorld.time_scale))
