class_name InventoryManagerNode
extends Node

signal food_level_changed(new_food: int)
signal fuel_level_changed(new_fuel: int)
signal heat_level_changed(new_heat: int)

@export var fuel: int = 2:
	set(value):
		fuel = value
		fuel_level_changed.emit(value)
@export var food: int = 1:
	set(value):
		food = value
		food_level_changed.emit(value)
@export var heat: float = 24:
	set(value):
		heat = value
		heat_level_changed.emit(value)


func _process(delta: float) -> void:
	heat = maxf(heat - delta * 0.5, -40)


func on_campfire_heating(heat_delta: float) -> void:
	heat = min(heat + heat_delta, 24)
