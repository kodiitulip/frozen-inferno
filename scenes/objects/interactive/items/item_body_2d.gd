class_name ItemBody2D
extends CharacterBody2D

const MAX_SPEED: float = 50.0
const ACCELERATION: float = 0.5

var speed: float = 0.0
var is_being_picked_up: bool = false

@export var item_info: ItemInfo = ItemInfo.new()

@onready var player: PlayerCharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	sprite_2d.texture = item_info.item_icon


func _physics_process(delta: float) -> void:
	if is_being_picked_up:
		speed = lerpf(speed, MAX_SPEED, ACCELERATION * delta)
		velocity = global_position.direction_to(player.global_position) * speed
	else:
		velocity.x = move_toward(velocity.x, 0, delta * 0.7)
		velocity.y = move_toward(velocity.y, 0, delta * 0.7)
	var collision: KinematicCollision2D = move_and_collide(velocity)
	if collision:
		_handle_pick_up()


func _handle_pick_up() -> void:
	match item_info.item_type:
		ItemInfo.ItemType.FUEL:
			InventoryManager.fuel += 1
		_:
			return queue_free()
	queue_free()


func _on_mouse_entered() -> void:
	#is_being_picked_up = true
	pass


func _on_input_event(_v: Node, event: InputEvent, _si: int) -> void:
	var interacted: bool = (
		event is InputEventMouseMotion or
		event is InputEventScreenDrag or
		event is InputEventScreenTouch
	)
	if interacted:
		is_being_picked_up = true
