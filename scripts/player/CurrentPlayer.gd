extends Node

class_name CurrentPlayer

var player = null


func _ready():
	pass


func get_current_player() -> Dictionary:
	if null == player:
		var players = Lobby.get_players()
		
		for i in range(players.size()):
			var player_object: Dictionary = players[i]
			
			if player_object.get('network_id') == get_tree().get_network_unique_id():
				player = player_object
				break
				
	return player
