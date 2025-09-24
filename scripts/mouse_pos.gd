class_name MouseFollower2D
extends Node2D

@export var anchor: Node2D
@export var max_distance: float = 30.0

func _process(_delta: float) -> void:
	if not anchor:
		global_position = get_global_mouse_position()
		return
	global_position = (get_global_mouse_position() - anchor.global_position
		).limit_length(max_distance) + anchor.global_position
	pass
