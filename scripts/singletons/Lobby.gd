extends Node

var players = []

signal update_lobby(players)


func _ready():
	pass


func set_players(value: Array) -> void:
	players = value
	emit_signal('update_lobby', value)


func get_players() -> Array:
	return players
