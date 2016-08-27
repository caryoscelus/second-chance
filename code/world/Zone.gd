# zone info
extends TextureButton

export(String) var id

func _on_pressed():
	get_parent().emit_signal("zone_clicked", self.id)
