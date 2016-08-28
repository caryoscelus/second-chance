# Contains properties of a group of potential employees
# - employee type
# - amount
# - skills
# - expected salary range
extends Node

onready var id = get_index()
export(String) var name
export(String, "worker", "engineer", "scientist") var type
export(int) var amount
export(float) var skill
export(float) var salary_min
export(float) var salary_great
export(bool) var active
