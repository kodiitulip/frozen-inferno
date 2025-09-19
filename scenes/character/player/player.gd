class_name PlayerCharacterBody2D
extends CharacterBody2D

@export var move_speed: float = 100
var heat: float = 20

func _process(delta: float) -> void:
	heat = max(heat - delta, 0)

	var direction: Vector2 = Input.get_vector(
		&"move_left", &"move_right",
		&"move_up", &"move_down"
	)

	var move_speed_mod: float = max(move_speed * (heat / 20), 50)

	velocity = direction.normalized() * move_speed_mod * delta * 25
	move_and_slide()


func on_campfire_heating(heat_delta: float) -> void:
	heat = min(heat + heat_delta, 20)
