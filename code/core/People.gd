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

## People: tribe/nation/whatever else group of people with similar
## characterestics

extends Node

export(String) var profession
export(String) var nation
# 0.0625 == 1.0/16 ; use the latter when it's supported by GDScript
export(float, 0.0625, 16.0) var skill = 1.0
export(int, 0, 65536) var amount
export(float, 0, 65536.0) var budget_food
export(float, 0, 65536.0) var budget_good
export(float, 0.0625, 16.0) var money_to_gold

# TODO: more character!
