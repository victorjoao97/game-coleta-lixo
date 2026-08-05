extends Control
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var pontuacao: Label = $Pontuacao

func atualizar_pontos(novos_pontos: int, objetivo: int) -> void:
	pontuacao.text = "Coletar\n%s latas de lixo" % str(objetivo)
	var porcentagem = float(novos_pontos) / float(objetivo) * 100
	var tween = create_tween()
	tween.tween_property(progress_bar, "value", porcentagem, 1)
