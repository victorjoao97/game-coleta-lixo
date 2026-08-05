extends Camera2D

@export var zoom_min := 2.0
@export var zoom_max := 5.0
@export var zoom_speed := 0.5
@export var delay := 0.5

func _unhandled_input(event):
	if event is InputEventMouseButton:
		print(event.button_index)
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			change_zoom(zoom_speed)

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			change_zoom(-zoom_speed)


func change_zoom(value):
	var novo_zoom = zoom.x + value
	novo_zoom = clamp(novo_zoom, zoom_min, zoom_max)

	var tween = create_tween()
	tween.tween_property(self, "zoom", Vector2(novo_zoom, novo_zoom), delay)
	#zoom = Vector2(novo_zoom, novo_zoom)
