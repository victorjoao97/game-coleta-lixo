extends Node

signal lixo_coletado
signal objetivo_atualizado(objetivo: int)
signal fase_concluida
signal fase_iniciada(tempo_limite: float)
signal tempo_finalizado
signal nova_tentativa
signal jogo_finalizado
signal countdown_iniciado

func emit_lixo_coletado():
	lixo_coletado.emit()

func emit_atualizar_objetivo(objetivo):
	objetivo_atualizado.emit(objetivo)

func emit_concluir_fase():
	fase_concluida.emit()

func emit_iniciar_fase(tempo_limite: float):
	fase_iniciada.emit(tempo_limite)

func emit_iniciar_countdown(tempo: float):
	countdown_iniciado.emit(tempo)

func emit_tempo_finalizado():
	tempo_finalizado.emit()
	
func emit_tentar_novamente():
	nova_tentativa.emit()

func emit_finalizar_jogo():
	jogo_finalizado.emit()
