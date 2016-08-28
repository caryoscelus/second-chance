extends TextureFrame

signal next_slide

export(String) var id
export(String, FILE, "*.tscn") var next_slide

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("advance_story"):
		emit_signal("next_slide", next_slide)
