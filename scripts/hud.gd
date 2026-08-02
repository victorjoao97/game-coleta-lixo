extends Control

func atualizar_pontos(novos_pontos: int, objetivo: int) -> void:
	$Pontuacao.text = str(novos_pontos) + "/" + str(objetivo)
