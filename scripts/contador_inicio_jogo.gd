extends Timer

@onready var label_contador_inicio_jogo: Label = $"../LabelContadorInicioJogo"

var segundos_restantes := 0

func _ready() -> void:
	label_contador_inicio_jogo.text = ""
	EventHub.connect("countdown_iniciado", _iniciar_countdown)
	timeout.connect(_segundo_passou)
	stop()

func _iniciar_countdown(_timeout: int):
	label_contador_inicio_jogo.show()
	segundos_restantes = _timeout
	wait_time = 1
	start()
	_atualizar_label()

func _segundo_passou():
	segundos_restantes -= 1
	_atualizar_label()

	if segundos_restantes < 0:
		stop()
		label_contador_inicio_jogo.queue_free()
		queue_free()

func _atualizar_label():
	label_contador_inicio_jogo.text = "%02d" % segundos_restantes
