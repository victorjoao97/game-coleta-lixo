extends Control
@onready var progress_bar: ProgressBar = $ProgressoContainer/VBoxContainer/ProgressBar
@onready var pontuacao: Label = $ProgressoContainer/VBoxContainer/Pontuacao
@onready var fase_concluida_panel: Panel = $FaseConcluidaPanel
@onready var contador_fim_jogo: Timer = $ContadorFimJogo
@onready var label_contador: Label = $CronometroContainer/VBoxContainer/LabelContador
@onready var perdeu_container: VBoxContainer = $FaseConcluidaPanel/PerdeuContainer
@onready var ganhou_container: VBoxContainer = $FaseConcluidaPanel/GanhouContainer

var objetivo = 0
var pontos = 0

func _ready() -> void:
	fase_concluida_panel.hide()
	ganhou_container.hide()
	perdeu_container.hide()
	
	EventHub.lixo_coletado.connect(atualizar_pontos)
	EventHub.objetivo_atualizado.connect(atualizar_objetivo)
	EventHub.fase_concluida.connect(concluir_fase)
	EventHub.fase_iniciada.connect(iniciar_fase)

func iniciar_fase(tempo_limite: int):
	contador_fim_jogo.wait_time = tempo_limite
	contador_fim_jogo.start()

func concluir_fase() -> void:
	fase_concluida_panel.show()
	ganhou_container.show()

func atualizar_objetivo(objetivo: int) -> void:
	pontuacao.text = "Coletar\n%s latas de lixo" % str(objetivo)
	self.objetivo = objetivo
	
func atualizar_pontos() -> void:
	pontos += 1
	var porcentagem = float(pontos) / float(objetivo) * 100
	var tween = create_tween()
	tween.tween_property(progress_bar, "value", porcentagem, 1)

func _on_contador_fim_jogo_timeout() -> void:
	EventHub.emit_tempo_finalizado()
	mostrar_perdeu_container()
	print("você perdeu")

func mostrar_perdeu_container():
	fase_concluida_panel.show()
	perdeu_container.show()

func _on_tentar_novamente_pressed() -> void:
	EventHub.emit_tentar_novamente()

func _on_sair_pressed() -> void:
	EventHub.emit_finalizar_jogo()
