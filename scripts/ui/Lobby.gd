extends Control

export(NodePath) var server_path
onready var server = get_node(server_path)

export(NodePath) var lobby_grid_path
onready var lobby_grid: GridContainer = get_node(lobby_grid_path)

export(PackedScene) var lobby_player_scene: PackedScene


func _ready():
	server.connect('update_lobby', self, 'update_lobby')


func update_lobby(value):
	Lobby.set_players(value);
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
