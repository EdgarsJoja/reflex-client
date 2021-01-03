extends Control

export(NodePath) var username_label_path
onready var username_label: Label = get_node(username_label_path)

export(NodePath) var ready_button_path
onready var ready_button: CheckButton = get_node(ready_button_path)

var player = {}


func _ready():
	username_label.text = player.get('username', '(No name)')
	
	init_ready_button()
	ready_button.connect('toggled', self, 'set_player_status')


func set_player(value: Dictionary) -> void:
	player = value


func set_player_status(ready_on: bool) -> void:
	Signals.emit_signal('update_player_data', {
		'status': 'ready' if ready_on else 'waiting'
	})


func init_ready_button() -> void:
	ready_button.pressed = player.get('status') == 'ready'
