class_name PlayerCharacterBody2D
extends CharacterBody2D

const CAMPFIRE: PackedScene = preload("uid://848vf8p0lsa7")

var input_dir: Vector2
var move_speed: float
var frozen: bool = false

@export var max_move_speed: float = 60
@export var min_move_speed: float = 20

func _ready() -> void:
	InventoryManager.frozen.connect(_freeze_player)


func _process(_delta: float) -> void:
	input_dir = Input.get_vector(
		&"move_left", &"move_right",
		&"move_up", &"move_down"
	).normalized()
	move_speed = maxf(max_move_speed * (InventoryManager.heat / 24),
			min_move_speed) if not frozen else 0.0


func _physics_process(_delta: float) -> void:
	velocity = input_dir * move_speed
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"build_campfire"):
		if InventoryManager.fuel >= 5:
			_place_campfire()


func _freeze_player(freeze: bool) -> void:
	frozen = freeze


func _place_campfire() -> void:
	var mouse_follower: MouseFollower2D = get_tree()\
			.get_first_node_in_group("mouse_follower")
	var camp: CampfireArea = CAMPFIRE.instantiate()
	get_tree().current_scene.add_child(camp)
	camp.global_position = mouse_follower.global_position\
			.snapped(Vector2(16.0, 16.0)) + Vector2(8.0, 8.0)
	InventoryManager.fuel -= 5
