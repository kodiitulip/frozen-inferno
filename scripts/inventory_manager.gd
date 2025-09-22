class_name InventoryManagerNode
extends Node

signal fuel_level_changed(new_fuel: int)
signal heat_level_changed(new_heat: int)
signal frozen(freeze: bool)

@export var fuel: int = 2:
	set(value):
		fuel = value
		fuel_level_changed.emit(value)
@export var heat: float = 24:
	set(value):
		heat = value
		heat_level_changed.emit(value)

func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale_language())


func reset() -> Error:
	var tree: SceneTree = get_tree()
	fuel = 2
	heat = 24
	var _err: Error = tree.reload_current_scene()
	while not tree.current_scene:
		await tree.create_timer(1).timeout
	await tree.current_scene.ready
	return _err


func _process(delta: float) -> void:
	heat = maxf(heat - delta * 0.5, -40)


func on_campfire_heating(heat_delta: float) -> void:
	heat = min(heat + heat_delta, 24)


func freeze_player() -> void:
	frozen.emit(true)
