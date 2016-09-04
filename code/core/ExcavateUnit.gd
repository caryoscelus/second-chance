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

extends "Unit.gd"

signal digged

const WORKERS_PER_ENGINEER = 16
const ENGINEER_BONUS = 1.0

func _init():
	task = "excavate"

func _ready():
	# connect to grand-parent, which should be excavation site
	# TODO: make sure connection is correct
	connect("digged", get_node("../.."), "apply_work")

func process(dt):
	var productivity = worker_power() * engineer_bonus()
	emit_signal("digged", {"gold":productivity})

func worker_power():
	return get_power("worker")

func engineer_bonus():
	var workers = get_amount("worker")
	if workers <= 0:
		return 1.0
	var can_handle = get_power("engineer") * WORKERS_PER_ENGINEER
	var handled = min(can_handle, workers)
	return 1.0 + ENGINEER_BONUS*(handled/workers)
