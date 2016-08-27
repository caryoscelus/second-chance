# world map
extends TextureFrame

onready var stats = get_node("stats")

func _on_show_stats_button_pressed():
	stats.popup()
