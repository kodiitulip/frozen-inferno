extends VBoxContainer

@onready var fuel_label: Label = %FuelLabel
@onready var heat_label: Label = %HeatLabel

func _ready() -> void:
	fuel_label.text = "%s" % (InventoryManager.fuel)
	heat_label.text = "%s" % int(InventoryManager.heat)
	InventoryManager.fuel_level_changed.connect(_set_new_fuel)
	InventoryManager.heat_level_changed.connect(_set_new_heat)


func _exit_tree() -> void:
	InventoryManager.fuel_level_changed.disconnect(_set_new_fuel)
	InventoryManager.heat_level_changed.disconnect(_set_new_heat)


func _set_new_heat(value: int) -> void:
	heat_label.text = "%s" % value


func _set_new_fuel(value: int) -> void:
	fuel_label.text = "%s" % value
