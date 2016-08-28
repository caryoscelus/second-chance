extends Node

signal log_updated

class EventLog:
	var text = ""

var main = EventLog.new()

func get_log(name):
	return get(name)

func write(name, message):
	get_log(name).text += message+"\n"
	emit_signal("log_updated")
