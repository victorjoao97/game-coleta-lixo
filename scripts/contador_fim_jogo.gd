extends Timer
@onready var label_contador: Label = $"../CronometroContainer/VBoxContainer/LabelContador"

func _process(delta: float) -> void:
	var tempo = int(ceil(time_left))

	var minutos = tempo / 60
	var segundos = tempo % 60

	label_contador.text = "%02d:%02d" % [minutos, segundos]

	var porcentagem_restante = time_left / wait_time * 100
	if wait_time > 0.001:
		if porcentagem_restante < 20:
			label_contador.modulate = Color.RED
			return
		if porcentagem_restante < 40:
			label_contador.modulate = Color.YELLOW
			return
