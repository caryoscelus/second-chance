# WorldMap zones
extends Container

signal zone_clicked(id)

func _on_zone_clicked(id):
	print(id)
