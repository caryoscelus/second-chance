extends PanelContainer

onready var log_text = get_node("log_text")
onready var source = GlobalEventLog.get_log("main")

func _ready():
	GlobalEventLog.connect("log_updated", self, "update_log")
	update_log()

func update_log():
	log_text.parse_bbcode(source.text)
