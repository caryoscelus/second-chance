# dialogue speaker
extends Node

export(String) var name
export(String, FILE) var portrait

var texture

func _ready():
	texture = load(portrait)
