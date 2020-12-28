extends Control

export(NodePath) var username_label_path
onready var username_label: Label = get_node(username_label_path)

var player = {}


func _ready():
	username_label.text = player.get('username', '(No name)')


func set_player(value: Dictionary) -> void:
	player = value
