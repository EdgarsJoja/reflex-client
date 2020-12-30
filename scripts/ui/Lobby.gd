extends Control

export(NodePath) var lobby_grid_path
onready var lobby_grid: GridContainer = get_node(lobby_grid_path)

export(PackedScene) var lobby_player_scene: PackedScene


func _ready():
	Lobby.connect('update_lobby', self, 'update_lobby')


func update_lobby(value):
	create_lobby_players_ui(value)


func create_lobby_players_ui(players: Array) -> void:
	clear_lobby_players_ui()
	
	for player in players:
		var player_node = lobby_player_scene.instance()
		player_node.set_player(player)
		player_node.set_name(str(player['network_id']))

		lobby_grid.add_child(player_node, true)


func clear_lobby_players_ui() -> void:
	for player in lobby_grid.get_children():
		player.queue_free()
