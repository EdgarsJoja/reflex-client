extends Control

export(NodePath) var username_input_path
onready var username_input: LineEdit = get_node(username_input_path)

export(NodePath) var login_button_path
onready var login_button: Button = get_node(login_button_path)


func _ready():
	login_button.connect('button_up', self, 'login_player')
	get_tree().connect('connected_to_server', self, 'connected_to_server')


func login_player() -> void:
	Signals.emit_signal('connect_to_server')
	

func connected_to_server() -> void:
	var username = username_input.text

	Signals.emit_signal('update_player_data', {
		'username': username
	})
