extends Node2D

export var host = '127.0.0.1'
export var port = 9009

# Called when the node enters the scene tree for the first time.
func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(host, port)
	get_tree().network_peer = peer

