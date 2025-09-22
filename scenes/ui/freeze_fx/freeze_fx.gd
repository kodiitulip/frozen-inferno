@tool
extends CanvasLayer

var freezing: bool = false:
	set = _set_freezing
var past_heat: float = 0.0

@export var gradient: Gradient
#@onready var label: Label = $FreezeFXTexture/Label
@onready var freeze_fx_texture: TextureRect = $FreezeFXTexture
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	freeze_fx_texture.texture.set(&"gradient", gradient)
	if Engine.is_editor_hint():
		return
	gradient.changed.connect(_update_texture)
	InventoryManager.heat_level_changed.connect(_on_heat_level_changed)


func _freeze_player() -> void:
	if animation_player.get_playing_speed() < 0: return
	InventoryManager.freeze_player()


func _die_and_end() -> void:
	if animation_player.get_playing_speed() < 0: return
	var res: Error = await InventoryManager.reset()
	if res == OK:
		_unfreeze()


func _freeze(speed: float = 0.08) -> void:
	animation_player.speed_scale = speed
	animation_player.pause()
	animation_player.play(&"freeze")


func _unfreeze(speed: float = 0.2) -> void:
	animation_player.speed_scale = speed
	animation_player.pause()
	animation_player.play_backwards(&"freeze")


func _fast_unfreeze() -> void:
	_unfreeze(1.0)


func _on_heat_level_changed(heat: float) -> void:
	freezing = heat < past_heat and heat <= 10
	past_heat = heat


func _set_freezing(val: bool) -> void:
	#var speed: float = animation_player.get_playing_speed()
	if freezing == val:
		return
	if val:
		_freeze()
	else:
		_unfreeze()
	freezing = val


func _update_texture() -> void:
	freeze_fx_texture.texture.set(&"gradient", gradient)
