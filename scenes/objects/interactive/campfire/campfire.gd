class_name CampfireArea
extends Area2D

signal campfire_heated(heat: float)

var player: PlayerCharacterBody2D
var fuel: float = 100

@onready var fuel_bar: ProgressBar = $FuelBar
@onready var fire_particles: GPUParticles2D = %FireParticles
@onready var mouse_indicator: TextureRect = $MouseIndicator

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	input_event.connect(_on_input_event)
	campfire_heated.connect(InventoryManager.on_campfire_heating)


func _process(delta: float) -> void:
	fire_particles.emitting = fuel > 0
	fuel = clampf(fuel - delta * 2.5, 0, 100)
	fuel_bar.value = fuel
	if player and fuel > 0:
		campfire_heated.emit(delta * 2.5)


func _on_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacterBody2D:
		return
	player = body
	if fuel < 100:
		mouse_indicator.show()


func _on_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacterBody2D:
		return
	if body != player:
		return
	player = null
	mouse_indicator.hide()


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed(&"mouse_click_left") and player:
		if InventoryManager.fuel <= 0:
			return
		InventoryManager.fuel = maxi(InventoryManager.fuel - 1, 0)
		fuel += 30
