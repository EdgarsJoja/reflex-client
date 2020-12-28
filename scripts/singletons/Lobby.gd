extends Node

var players = []


func _ready():
	pass


func set_players(value: Array) -> void:
	players = value


func get_players() -> Array:
	return players
