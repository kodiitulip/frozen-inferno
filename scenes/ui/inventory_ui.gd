extends VBoxContainer

@onready var fuel_label: Label = %FuelLabel
@onready var food_label: Label = %FoodLabel
@onready var heat_label: Label = %HeatLabel

func _ready() -> void:
	fuel_label.text = "%s" % (InventoryManager.fuel)
	food_label.text = "%s" % (InventoryManager.food)
	heat_label.text = "%s" % int(InventoryManager.heat)
	InventoryManager.food_level_changed.connect(_set_new_food)
	InventoryManager.fuel_level_changed.connect(_set_new_fuel)
	InventoryManager.heat_level_changed.connect(_set_new_heat)


func _exit_tree() -> void:
	InventoryManager.food_level_changed.disconnect(_set_new_food)
	InventoryManager.fuel_level_changed.disconnect(_set_new_fuel)
	InventoryManager.heat_level_changed.disconnect(_set_new_heat)


func _set_new_heat(value: int) -> void:
	heat_label.text = "%s" % value

func _set_new_food(value: int) -> void:
	food_label.text = "%s" % value

func _set_new_fuel(value: int) -> void:
	fuel_label.text = "%s" % value
