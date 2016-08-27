extends Container

func _ready():
	select_tab(0)

func select_tab(id):
	# meh, lets assume id == child number
	hide_all()
	get_child(id).set_hidden(false)

func hide_all():
	for child in get_children():
		if not "persistent" in child.get_groups():
			child.set_hidden(true)
