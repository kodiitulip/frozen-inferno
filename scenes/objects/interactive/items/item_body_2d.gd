class_name ItemBody2D
extends CharacterBody2D

@onready var player: PlayerCharacterBody2D = get_tree().get_first_node_in_group("player")

const MAX_SPEED: float = 50.0
const ACCELERATION: float = 0.5

var speed: float = 0.0
var is_being_picked_up: bool = false

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)


func _physics_process(delta: float) -> void:
	if is_being_picked_up:
		speed = lerpf(speed, MAX_SPEED, ACCELERATION * delta)
		velocity = global_position.direction_to(player.global_position) * speed
	var collision: KinematicCollision2D = move_and_collide(velocity)
	if collision:
		_handle_pick_up()


func _handle_pick_up() -> void:
	queue_free()


func _on_mouse_entered() -> void:
	is_being_picked_up = true
