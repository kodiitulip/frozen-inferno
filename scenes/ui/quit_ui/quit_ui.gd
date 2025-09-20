extends ProgressBar

func _process(delta: float) -> void:
	visible = value > 0.0
	if Input.is_action_pressed(&"escape"):
		value = lerpf(value, value + 1, delta * 2)
		if value == max_value:
			get_tree().quit()
	else:
		value = lerpf(value, value - 1, delta)
