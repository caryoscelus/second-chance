# WorldMap zones
extends StaticBody2D

signal zone_clicked(id)

onready var highlight = get_node("highlight")

func _on_mouse_enter():
	highlight.set_hidden(false)

func _on_mouse_exit():
	highlight.set_hidden(true)

func _on_input_event(viewport, event, shape_idx):
	# meh
	var shape_node = get_node("zone_"+str(shape_idx))
	highlight.set_polygon(shape_node.get_polygon())
	if event.is_pressed():
		emit_signal("zone_clicked", shape_idx)
