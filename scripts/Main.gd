extends Node2D

export var host = '127.0.0.1'
export var port = 9009

# Called when the node enters the scene tree for the first time.
func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(host, port)
	get_tree().network_peer = peer

	get_tree().connect('connected_to_server', self, 'connected_to_server')
	get_tree().connect('connection_failed', self, 'connection_failed')
	get_tree().connect('server_disconnected', self, 'server_disconnected')


func connected_to_server():
	print('Connected. Client id (%s)' % get_tree().get_network_unique_id())


func connection_failed():
	print('Connection failed')


func server_disconnected():
	print('Server disconnected')
