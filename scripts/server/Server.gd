extends Node

export var host = '127.0.0.1'
export var port = 9009

signal update_lobby(players)


func _ready():
	Signals.connect('connect_to_server', self, 'connect_to_server')


func connect_to_server() -> void:
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(host, port)
	get_tree().network_peer = peer

	get_tree().connect('connected_to_server', self, 'connected_to_server')
	get_tree().connect('connection_failed', self, 'connection_failed')
	get_tree().connect('server_disconnected', self, 'server_disconnected')
	
	Signals.connect('update_player_data', self, 'update_player_data')


func connected_to_server():
	print('Connected. Client id (%s)' % get_tree().get_network_unique_id())


func connection_failed():
	print('Connection failed')


func server_disconnected():
	print('Server disconnected')


remote func update_lobby(players):
	Lobby.set_players(players)


func update_player_data(data: Dictionary) -> void:
	rpc_id(1, 'update_player_data', data)
