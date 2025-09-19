extends Area2D

signal campfire_heated(heat: float)

var player: PlayerCharacterBody2D
var fuel: float = 100

@onready var fuel_bar: ProgressBar = $FuelBar

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _process(delta: float) -> void:
	fuel = clampf(fuel - delta * 2.5, 0, 100)
	fuel_bar.value = fuel
	if fuel > 0:
		campfire_heated.emit(delta * 1.5)


func _on_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacterBody2D:
		return
	player = body
	campfire_heated.connect(player.on_campfire_heating)


func _on_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacterBody2D:
		return
	if body != player:
		return
	campfire_heated.disconnect(player.on_campfire_heating)
	player = null
