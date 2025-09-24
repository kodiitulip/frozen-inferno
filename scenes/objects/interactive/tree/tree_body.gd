class_name InteractableArea2D
extends StaticBody2D

const ITEM_BODY_2D: PackedScene = preload("uid://bhwx338iiabqj")

var tries: int = randi_range(2, 5)
var sticks: int = randi_range(3, 5)

@export var drpped_item: ItemInfo

@onready var sprite_2d: Sprite2D = $"Sprite2D"

func _on_input_event(_v: Node, event: InputEvent, _si: int) -> void:
	var interacted: bool = event.is_action_pressed(&"mouse_click_left") or  \
			(event is InputEventScreenTouch and event.is_pressed())
	if interacted:
		var degre: float = ((randi_range(0, 1) * 2) - 1) * 5
		var t: Tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
		t.tween_property(sprite_2d, ^"rotation_degrees", degre, 0.2)
		t.tween_property(sprite_2d, ^"rotation_degrees", -degre, 0.3)
		t.tween_property(sprite_2d, ^"rotation_degrees", 0, 0.2)
		await t.finished
		tries -= 1
		if tries > 0:
			return
		tries = randi_range(2, 5)
		sticks -= 1
		var item: ItemBody2D = ITEM_BODY_2D.instantiate()
		get_tree().current_scene.add_child(item)
		item.global_position = global_position
		item.velocity = Vector2(
			((randf() * 2) - 1) * 0.3,
			randf() * 0.5 + 0.5
		)
		if sticks == 0:
			queue_free()
