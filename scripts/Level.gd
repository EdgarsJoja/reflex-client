extends Node

export(PackedScene) var lobby_scene
export(PackedScene) var login_scene

enum Level {
	LOGIN,
	LOBBY
}

const default_level = Level.LOGIN


func _ready():
	load_level(default_level)
	
	get_tree().connect('connected_to_server', self, 'connected_to_server')


func load_level(level) -> void:
	clear_level()
	
	var level_node = null

	match level:
		Level.LOGIN:
			level_node = get_login_level()
		Level.LOBBY:
			level_node = get_lobby_level()
		_:
			pass
	
	self.add_child(level_node, true)


func get_lobby_level() -> Node:
	return get_scene_instance(lobby_scene)


func get_login_level() -> Node:
	return get_scene_instance(login_scene)


func get_scene_instance(packed_scene: PackedScene) -> Node:
	return packed_scene.instance()


func clear_level() -> void:
	for child in get_children():
		child.queue_free()


func connected_to_server():
	load_level(Level.LOBBY)
