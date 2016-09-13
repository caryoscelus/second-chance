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

## main test menu: choose test options

extends TextureFrame

func on_menu_clicked(idx):
	if idx == 0:
		get_tree().change_scene("res://scenes/story/Intro.tscn")
	elif idx == 1:
		get_tree().change_scene("res://scenes/")
	elif idx == 2:
		get_tree().change_scene("res://scenes/")
