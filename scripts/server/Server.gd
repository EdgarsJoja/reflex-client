extends Node

signal update_lobby(players)


func _ready():
	pass


remote func update_lobby(players):
	emit_signal('update_lobby', players)
