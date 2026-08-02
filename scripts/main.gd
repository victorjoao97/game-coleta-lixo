extends Node2D
var pontos := 0
var objetivo := 2

func _ready() -> void:
	atualizar_pontos()

func _on_lixo_coletado():
	pontos += 1
	atualizar_pontos()

func atualizar_pontos():
	$CanvasLayer/HUD.atualizar_pontos(pontos, objetivo)
	if (pontos == objetivo):
		$CanvasLayer/HUD/PanelGanhou.visible = true
		$Caminhao.process_mode = Node.PROCESS_MODE_DISABLED
		return
