class_name PlayerCharacterBody2D
extends CharacterBody2D

var input_dir: Vector2
var move_speed: float

@export var max_move_speed: float = 60
@export var min_move_speed: float = 20

func _process(_delta: float) -> void:
	input_dir = Input.get_vector(
		&"move_left", &"move_right",
		&"move_up", &"move_down"
	).normalized()
	move_speed = maxf(max_move_speed * (InventoryManager.heat / 24),
			min_move_speed)


func _physics_process(_delta: float) -> void:
	velocity = input_dir * move_speed
	move_and_slide()
